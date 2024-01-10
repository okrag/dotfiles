{ stdenv
, fetchFromGitLab
, cmake
, pkg-config
, extra-cmake-modules
, qt5
, libsForQt5
}: stdenv.mkDerivation rec {
  pname = "xwaylandvideobridge";
  version = "custom-1";

  src = fetchFromGitLab {
    domain = "invent.kde.org";
    owner = "system";
    repo = "xwaylandvideobridge";
    rev = "4555293e49129dcb5f8c3354c86b29d561ca4034";
    hash = "sha256-YtFcf43DQy7ImFYYQ45ELPRdFYVrBkpL/Bam8SUEVfE=";
  };

  patches = [ ./xwaylandvideobridge.patch ];

  nativeBuildInputs = [
    cmake
    extra-cmake-modules
    pkg-config
    qt5.wrapQtAppsHook
  ];

  buildInputs = [
    qt5.qtbase
    qt5.qtquickcontrols2
    qt5.qtx11extras
    libsForQt5.kdelibs4support
    (libsForQt5.kpipewire.overrideAttrs (oldAttrs: {
      version = "unstable-2023-03-28";

      src = fetchFromGitLab {
        domain = "invent.kde.org";
        owner = "plasma";
        repo = "kpipewire";
        rev = "176ac3da53dd09cc4d4ce37910c62c5cfb5dd190";
        hash = "sha256-u+CGk/jm5pHTPJYwKHwHc01c9E+ElsfKkzYg5NfIaJ8=";
      };
    }))
  ];
}
