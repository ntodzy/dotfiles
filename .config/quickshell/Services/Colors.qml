pragma Singleton

// import "root:/config"
import Quickshell
import Quickshell.Io
import QtQuick

QtObject {
    function rgba(r, g, b, a) {
        return Qt.rgba(r / 255, g / 255, b / 255, 1);
    }

    id: mat3
    
    property color background: rgba(17, 19, 23, 1)
    
    property color error: rgba(255, 180, 171, 1)
    
    property color error_container: rgba(147, 0, 10, 1)
    
    property color inverse_on_surface: rgba(47, 48, 52, 1)
    
    property color inverse_primary: rgba(51, 97, 145, 1)
    
    property color inverse_surface: rgba(226, 226, 231, 1)
    
    property color on_background: rgba(226, 226, 231, 1)
    
    property color on_error: rgba(105, 0, 5, 1)
    
    property color on_error_container: rgba(255, 218, 214, 1)
    
    property color on_primary: rgba(0, 50, 89, 1)
    
    property color on_primary_container: rgba(0, 0, 0, 1)
    
    property color on_primary_fixed: rgba(0, 29, 54, 1)
    
    property color on_primary_fixed_variant: rgba(21, 73, 120, 1)
    
    property color on_secondary: rgba(34, 49, 68, 1)
    
    property color on_secondary_container: rgba(213, 229, 254, 1)
    
    property color on_secondary_fixed: rgba(12, 28, 46, 1)
    
    property color on_secondary_fixed_variant: rgba(57, 72, 91, 1)
    
    property color on_surface: rgba(226, 226, 231, 1)
    
    property color on_surface_variant: rgba(194, 199, 208, 1)
    
    property color on_tertiary: rgba(72, 31, 82, 1)
    
    property color on_tertiary_container: rgba(0, 0, 0, 1)
    
    property color on_tertiary_fixed: rgba(49, 7, 59, 1)
    
    property color on_tertiary_fixed_variant: rgba(97, 54, 106, 1)
    
    property color outline: rgba(140, 145, 154, 1)
    
    property color outline_variant: rgba(66, 71, 79, 1)
    
    property color primary: rgba(159, 202, 255, 1)
    
    property color primary_container: rgba(104, 148, 199, 1)
    
    property color primary_fixed: rgba(210, 228, 255, 1)
    
    property color primary_fixed_dim: rgba(159, 202, 255, 1)
    
    property color scrim: rgba(0, 0, 0, 1)
    
    property color secondary: rgba(184, 200, 224, 1)
    
    property color secondary_container: rgba(59, 74, 94, 1)
    
    property color secondary_fixed: rgba(212, 228, 252, 1)
    
    property color secondary_fixed_dim: rgba(184, 200, 224, 1)
    
    property color shadow: rgba(0, 0, 0, 1)
    
    property color source_color: rgba(80, 124, 174, 1)
    
    property color surface: rgba(17, 19, 23, 1)
    
    property color surface_bright: rgba(55, 57, 61, 1)
    
    property color surface_container: rgba(30, 32, 35, 1)
    
    property color surface_container_high: rgba(40, 42, 46, 1)
    
    property color surface_container_highest: rgba(51, 53, 56, 1)
    
    property color surface_container_low: rgba(26, 28, 31, 1)
    
    property color surface_container_lowest: rgba(12, 14, 17, 1)
    
    property color surface_dim: rgba(17, 19, 23, 1)
    
    property color surface_tint: rgba(159, 202, 255, 1)
    
    property color surface_variant: rgba(66, 71, 79, 1)
    
    property color tertiary: rgba(235, 180, 242, 1)
    
    property color tertiary_container: rgba(177, 127, 185, 1)
    
    property color tertiary_fixed: rgba(253, 214, 255, 1)
    
    property color tertiary_fixed_dim: rgba(235, 180, 242, 1)
    

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
