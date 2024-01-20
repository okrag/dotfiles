{ config }:
let
  _ = config.lib.formats.rasi.mkLiteral;
in
with (import ../theme.nix).rofi; {
  "*" = {
    border = _ border;
    bg = _ bg;
    prompt-bg = _ prompt_bg;
    prompt-text = _ prompt_text;

    entry-bg = _ entry_bg;
    entry-text = _ entry_text;

    entry-selected-bg = _ entry_selected_bg;
    entry-selected-text = _ entry_selected_text;

    button-bg = _ button_bg;
    button-text = _ button_text;

    button-selected-bg = _ button_semv lected_bg;
    button-selected-text = _ button_selected_text;

    message-bg = _ message_bg;

    textbox-bg = _ textbox_bg;
    textbox-text = _ textbox_text;

    width = 700;
    font = "JetBrainsMono Nerd Font SemiBold 10";
  };

  "element-text, element-icon, mode-switcher" = {
    background-color = _ "inherit";
    text-color = _ "inherit";
  };

  window = {
    height = 450;
    border = 2;
    border-radius = 10;
    border-color = _ "@border";
    background-color = _ "@bg";
  };

  mainbox = {
    #background-color = _ "@bg";
    background-color = _ "transparent";
  };

  inputbar = {
    children = map _ [ "prompt" "entry" ];
    # background-color = _ "@bg";
    background-color = _ "transparent";
    border-radius = 5;
    padding = 2;
  };

  prompt = {
    background-color = _ "@prompt-bg";
    padding = 6;
    text-color = _ "@prompt-text";
    border-radius = 3;
    margin = _ "20px 0px 0px 20px";
  };

  textbox-prompt-colon = {
    expand = false;
    str = ":";
  };

  entry = {
    padding = 6;
    margin = _ "20px 0px 0px 10px";
    text-color = _ "@entry-text";
    # background-color = _ "@entry-bg";
    background-color = _ "transparent";
  };

  listview = {
    border = _ "0px 0px 0px";
    padding = _ "6px 0px 0px";
    margin = _ "10px 0px 0px 20px";
    columns = 3;
    lines = 5;
    # background-color = _ "@bg";
    background-color = _ "transparent";
  };

  element = {
    padding = 5;
    text-color = _ "@entry-text";
    # background-color = _ "@entry-bg";
    background-color = _ "transparent";
  };

  element-icon = {
    size = 25;
  };

  "element selected" = {
    # background-color = _ "@entry-selected-bg";
    background-color = _ "transparent";
    text-color = _ "@entry-selected-text";
  };

  mode-switcher = {
    spacing = 0;
  };

  button = {
    padding = 10;
    # background-color = _ "@button-bg";
    background-color = _ "transparent";
    text-color = _ "@button-text";
    vertical-align = _ "0.5";
    horizontal-align = _ "0.5";
  };

  "button selected" = {
    # background-color = _ "@button-selected-bg";
    background-color = _ "transparent";
    text-color = _ "@button-selected-text";
  };

  message = {
    # background-color = _ "@message-bg";
    background-color = _ "transparent";
    margin = 2;
    padding = 2;
    border-radius = 5;
  };

  textbox = {
    padding = 6;
    margin = _ "20px 0px 0px 20px";
    text-color = _ "@textbox-text";
    # background-color = _ "@textbox-bg";
    background-color = _ "transparent";
  };
}
