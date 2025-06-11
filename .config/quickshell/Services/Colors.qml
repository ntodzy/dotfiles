pragma Singleton

// import "root:/config"
import Quickshell
import Quickshell.Io
import QtQuick



QtObject {
    function rgb(r, g, b) {
        return Qt.rgba(r / 255, g / 255, b / 255, 1);
    }

    id: mat3

    property color primary: rgb(170, 199, 255)
    property color surface_tint: rgb(170, 199, 255)
    property color on_primary: rgb(10, 48, 95);
    property color primary_container: rgb(40, 71, 119);
    property color on_primary_container: rgb(214, 227, 255);
    property color secondary: rgb(190, 198, 220);
    property color on_secondary: rgb(40, 49, 65);
    property color secondary_container: rgb(62, 71, 89);
    property color on_secondary_container: rgb(218, 226, 249);
    property color tertiary: rgb(221, 188, 224);
    property color on_tertiary: rgb(63, 40, 68);
    property color tertiary_container: rgb(87, 62, 92);
    property color on_tertiary_container: rgb(250, 216, 253);
    property color error: rgb(25, 180, 171);
    property color on_error: rgb(105, 0, 5);
    property color error_container: rgb(147, 0, 10);
    property color on_error_container: rgb(255, 218, 214);
    property color background: rgb(17, 19, 24);
    property color on_background: rgb(226, 226, 233);
    property color surface: rgb(17, 19, 24);
    property color on_surface: rgb(226, 226, 233);
    property color surface_variant: rgb(68, 71, 78);
    property color on_surface_variant: rgb(196, 198, 208);
    property color outline: rgb(142, 144,153);
    property color outline_variant: rgb(68, 71, 78);
    property color shadow: rgb(0, 0, 0);
    property color scrim: rgb(0, 0, 0);
    property color inverse_surface: rgb(226, 226, 233);
    property color inverse_on_surface: rgb(46, 48, 54);
    property color inverse_primary: rgb(65, 95, 145);
    property color primary_fixed: rgb(214, 227, 255);
    property color on_primary_fixed: rgb(0, 27, 62);
    property color primary_fixed_dim: rgb(170, 199 ,255);
    property color on_primary_fixed_variant: rgb(40, 71, 119);
    property color secondary_fixed: rgb(218, 226, 249);
    property color on_secondary_fixed: rgb(19, 28, 43);
    property color secondary_fixed_dim: rgb(190, 198, 220);
    property color on_secondary_fixed_variant: rgb(62, 71, 89);
    property color tertiary_fixed: rgb(250, 216, 253);
    property color on_tertiary_fixed: rgb(40, 19, 46);
    property color tertiary_fixed_dim: rgb(221, 188, 224);
    property color on_tertiary_fixed_variant: rgb(87, 62, 92);
    property color surface_dim: rgb(17, 19, 24);
    property color surface_bright: rgb(55, 57, 62);
    property color surface_container_lowest: rgb(12, 14, 19);
    property color surface_container_low: rgb(25, 28, 32);
    property color surface_container: rgb(29, 32, 36);
    property color surface_container_high: rgb(40, 42, 47);
    property color surface_container_highest: rgb(51, 53, 58);

    // Material You Colors, Taken from Caelestia Dots
    property color rosewater: "#B8C4FF"
    property color flamingo: "#DBB9F8"
    property color pink: "#F3B3E3"
    property color mauve: "#D0BDFE"
    property color red: "#F8B3D1"
    property color maroon: "#F6B2DA"
    property color peach: "#E4B7F4"
    property color yellow: "#C3C0FF"
    property color green: "#ADC6FF"
    property color teal: "#D4BBFC"
    property color sky: "#CBBEFF"
    property color sapphire: "#BDC2FF"
    property color blue: "#C7BFFF"
    property color lavender: "#EAB5ED"
}
