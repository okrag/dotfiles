{ stdenvNoCC, pkgs }:

stdenvNoCC.mkDerivation {
  pname = "plymouth-mc";
  version = "custom-2";

  src = ./plymouth-mc;

  nativeBuildInputs = with pkgs; [ ffmpeg ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/plymouth/themes/minecraft/images

    ffmpeg -i ./images/video.mp4 $out/share/plymouth/themes/minecraft/images/progress-%01d.png -hide_banner

    sed -i 's:\(^ImageDir=\)/usr:\1'"$out"':' minecraft.plymouth
    sed -i 's:\(^ScriptFile=\)/usr:\1'"$out"':' minecraft.plymouth

    cp ./images/*.png $out/share/plymouth/themes/minecraft/images
    cp minecraft.plymouth $out/share/plymouth/themes/minecraft
    cp minecraft.script $out/share/plymouth/themes/minecraft

    runHook postInstall
  '';
}
