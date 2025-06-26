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
    
    property color background: rgba(17, 20, 24, 1.0)
    
    property color error: rgba(255, 180, 171, 1.0)
    
    property color error_container: rgba(147, 0, 10, 1.0)
    
    property color inverse_on_surface: rgba(46, 49, 53, 1.0)
    
    property color inverse_primary: rgba(54, 97, 142, 1.0)
    
    property color inverse_surface: rgba(225, 226, 232, 1.0)
    
    property color on_background: rgba(225, 226, 232, 1.0)
    
    property color on_error: rgba(105, 0, 5, 1.0)
    
    property color on_error_container: rgba(255, 218, 214, 1.0)
    
    property color on_primary: rgba(0, 50, 88, 1.0)
    
    property color on_primary_container: rgba(209, 228, 255, 1.0)
    
    property color on_primary_fixed: rgba(0, 29, 54, 1.0)
    
    property color on_primary_fixed_variant: rgba(25, 73, 117, 1.0)
    
    property color on_secondary: rgba(37, 49, 64, 1.0)
    
    property color on_secondary_container: rgba(214, 227, 247, 1.0)
    
    property color on_secondary_fixed: rgba(16, 28, 43, 1.0)
    
    property color on_secondary_fixed_variant: rgba(59, 72, 88, 1.0)
    
    property color on_surface: rgba(225, 226, 232, 1.0)
    
    property color on_surface_variant: rgba(195, 199, 207, 1.0)
    
    property color on_tertiary: rgba(59, 41, 72, 1.0)
    
    property color on_tertiary_container: rgba(242, 218, 255, 1.0)
    
    property color on_tertiary_fixed: rgba(37, 20, 49, 1.0)
    
    property color on_tertiary_fixed_variant: rgba(82, 63, 95, 1.0)
    
    property color outline: rgba(141, 145, 153, 1.0)
    
    property color outline_variant: rgba(66, 71, 78, 1.0)
    
    property color primary: rgba(160, 202, 253, 1.0)
    
    property color primary_container: rgba(25, 73, 117, 1.0)
    
    property color primary_fixed: rgba(209, 228, 255, 1.0)
    
    property color primary_fixed_dim: rgba(160, 202, 253, 1.0)
    
    property color scrim: rgba(0, 0, 0, 1.0)
    
    property color secondary: rgba(187, 199, 219, 1.0)
    
    property color secondary_container: rgba(59, 72, 88, 1.0)
    
    property color secondary_fixed: rgba(214, 227, 247, 1.0)
    
    property color secondary_fixed_dim: rgba(187, 199, 219, 1.0)
    
    property color shadow: rgba(0, 0, 0, 1.0)
    
    property color source_color: rgba(87, 131, 180, 1.0)
    
    property color surface: rgba(17, 20, 24, 1.0)
    
    property color surface_bright: rgba(54, 57, 62, 1.0)
    
    property color surface_container: rgba(29, 32, 36, 1.0)
    
    property color surface_container_high: rgba(39, 42, 47, 1.0)
    
    property color surface_container_highest: rgba(50, 53, 58, 1.0)
    
    property color surface_container_low: rgba(25, 28, 32, 1.0)
    
    property color surface_container_lowest: rgba(11, 14, 19, 1.0)
    
    property color surface_dim: rgba(17, 20, 24, 1.0)
    
    property color surface_tint: rgba(160, 202, 253, 1.0)
    
    property color surface_variant: rgba(66, 71, 78, 1.0)
    
    property color tertiary: rgba(214, 190, 228, 1.0)
    
    property color tertiary_container: rgba(82, 63, 95, 1.0)
    
    property color tertiary_fixed: rgba(242, 218, 255, 1.0)
    
    property color tertiary_fixed_dim: rgba(214, 190, 228, 1.0)
    

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
