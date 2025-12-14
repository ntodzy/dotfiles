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
    
    property color background: rgba(25, 18, 12, 1.0)
    
    property color error: rgba(255, 180, 171, 1.0)
    
    property color error_container: rgba(147, 0, 10, 1.0)
    
    property color inverse_on_surface: rgba(55, 47, 40, 1.0)
    
    property color inverse_primary: rgba(135, 82, 28, 1.0)
    
    property color inverse_surface: rgba(239, 224, 213, 1.0)
    
    property color on_background: rgba(239, 224, 213, 1.0)
    
    property color on_error: rgba(105, 0, 5, 1.0)
    
    property color on_error_container: rgba(255, 218, 214, 1.0)
    
    property color on_primary: rgba(76, 39, 0, 1.0)
    
    property color on_primary_container: rgba(255, 220, 193, 1.0)
    
    property color on_primary_fixed: rgba(46, 21, 0, 1.0)
    
    property color on_primary_fixed_variant: rgba(107, 59, 4, 1.0)
    
    property color on_secondary: rgba(65, 44, 25, 1.0)
    
    property color on_secondary_container: rgba(255, 220, 193, 1.0)
    
    property color on_secondary_fixed: rgba(42, 23, 7, 1.0)
    
    property color on_secondary_fixed_variant: rgba(90, 66, 45, 1.0)
    
    property color on_surface: rgba(239, 224, 213, 1.0)
    
    property color on_surface_variant: rgba(214, 195, 182, 1.0)
    
    property color on_tertiary: rgba(45, 51, 14, 1.0)
    
    property color on_tertiary_container: rgba(223, 231, 178, 1.0)
    
    property color on_tertiary_fixed: rgba(24, 30, 0, 1.0)
    
    property color on_tertiary_fixed_variant: rgba(67, 74, 34, 1.0)
    
    property color outline: rgba(158, 142, 130, 1.0)
    
    property color outline_variant: rgba(81, 68, 58, 1.0)
    
    property color primary: rgba(255, 183, 120, 1.0)
    
    property color primary_container: rgba(107, 59, 4, 1.0)
    
    property color primary_fixed: rgba(255, 220, 193, 1.0)
    
    property color primary_fixed_dim: rgba(255, 183, 120, 1.0)
    
    property color scrim: rgba(0, 0, 0, 1.0)
    
    property color secondary: rgba(226, 192, 165, 1.0)
    
    property color secondary_container: rgba(90, 66, 45, 1.0)
    
    property color secondary_fixed: rgba(255, 220, 193, 1.0)
    
    property color secondary_fixed_dim: rgba(226, 192, 165, 1.0)
    
    property color shadow: rgba(0, 0, 0, 1.0)
    
    property color source_color: rgba(250, 144, 19, 1.0)
    
    property color surface: rgba(25, 18, 12, 1.0)
    
    property color surface_bright: rgba(65, 55, 48, 1.0)
    
    property color surface_container: rgba(38, 30, 24, 1.0)
    
    property color surface_container_high: rgba(49, 40, 34, 1.0)
    
    property color surface_container_highest: rgba(60, 51, 44, 1.0)
    
    property color surface_container_low: rgba(34, 26, 20, 1.0)
    
    property color surface_container_lowest: rgba(19, 13, 8, 1.0)
    
    property color surface_dim: rgba(25, 18, 12, 1.0)
    
    property color surface_tint: rgba(255, 183, 120, 1.0)
    
    property color surface_variant: rgba(81, 68, 58, 1.0)
    
    property color tertiary: rgba(195, 203, 152, 1.0)
    
    property color tertiary_container: rgba(67, 74, 34, 1.0)
    
    property color tertiary_fixed: rgba(223, 231, 178, 1.0)
    
    property color tertiary_fixed_dim: rgba(195, 203, 152, 1.0)
    

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
