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
    
    property color background: rgba(17, 19, 24, 1)
    
    property color error: rgba(255, 180, 171, 1)
    
    property color error_container: rgba(147, 0, 10, 1)
    
    property color inverse_on_surface: rgba(46, 48, 53, 1)
    
    property color inverse_primary: rgba(58, 96, 143, 1)
    
    property color inverse_surface: rgba(225, 226, 233, 1)
    
    property color on_background: rgba(225, 226, 233, 1)
    
    property color on_error: rgba(105, 0, 5, 1)
    
    property color on_error_container: rgba(255, 218, 214, 1)
    
    property color on_primary: rgba(0, 49, 92, 1)
    
    property color on_primary_container: rgba(211, 227, 255, 1)
    
    property color on_primary_fixed: rgba(0, 28, 57, 1)
    
    property color on_primary_fixed_variant: rgba(31, 72, 118, 1)
    
    property color on_secondary: rgba(38, 49, 65, 1)
    
    property color on_secondary_container: rgba(216, 227, 248, 1)
    
    property color on_secondary_fixed: rgba(17, 28, 43, 1)
    
    property color on_secondary_fixed_variant: rgba(60, 71, 88, 1)
    
    property color on_surface: rgba(225, 226, 233, 1)
    
    property color on_surface_variant: rgba(195, 198, 207, 1)
    
    property color on_tertiary: rgba(60, 41, 70, 1)
    
    property color on_tertiary_container: rgba(245, 217, 255, 1)
    
    property color on_tertiary_fixed: rgba(38, 20, 48, 1)
    
    property color on_tertiary_fixed_variant: rgba(84, 63, 94, 1)
    
    property color outline: rgba(141, 145, 153, 1)
    
    property color outline_variant: rgba(67, 71, 78, 1)
    
    property color primary: rgba(164, 201, 254, 1)
    
    property color primary_container: rgba(31, 72, 118, 1)
    
    property color primary_fixed: rgba(211, 227, 255, 1)
    
    property color primary_fixed_dim: rgba(164, 201, 254, 1)
    
    property color scrim: rgba(0, 0, 0, 1)
    
    property color secondary: rgba(188, 199, 219, 1)
    
    property color secondary_container: rgba(60, 71, 88, 1)
    
    property color secondary_fixed: rgba(216, 227, 248, 1)
    
    property color secondary_fixed_dim: rgba(188, 199, 219, 1)
    
    property color shadow: rgba(0, 0, 0, 1)
    
    property color source_color: rgba(70, 115, 171, 1)
    
    property color surface: rgba(17, 19, 24, 1)
    
    property color surface_bright: rgba(55, 57, 62, 1)
    
    property color surface_container: rgba(29, 32, 36, 1)
    
    property color surface_container_high: rgba(39, 42, 47, 1)
    
    property color surface_container_highest: rgba(50, 53, 58, 1)
    
    property color surface_container_low: rgba(25, 28, 32, 1)
    
    property color surface_container_lowest: rgba(12, 14, 19, 1)
    
    property color surface_dim: rgba(17, 19, 24, 1)
    
    property color surface_tint: rgba(164, 201, 254, 1)
    
    property color surface_variant: rgba(67, 71, 78, 1)
    
    property color tertiary: rgba(217, 189, 227, 1)
    
    property color tertiary_container: rgba(84, 63, 94, 1)
    
    property color tertiary_fixed: rgba(245, 217, 255, 1)
    
    property color tertiary_fixed_dim: rgba(217, 189, 227, 1)
    

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
