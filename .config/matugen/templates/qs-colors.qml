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
    <* for name, value in colors *>
    property color {{name}}: {{value.default.rgba }}
    <* endfor *>

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
