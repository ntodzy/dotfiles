import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Io

import "root:/services/" as Services

WrapperRectangle {
    Layout.minimumHeight: root.height - root.margin
    radius: 24
    color: Services.Colors.primary_container

    RowLayout {
        anchors.fill: parent
        spacing: 6

        Rectangle {
            // Padding
            width: 6
        }

        Text {
            text: "   " + Services.Weather.feelslike_f + " °F"
            color: Services.Colors.on_primary_container
            Layout.alignment: Qt.AlignVCenter
        }

        Rectangle {
            // Padding
            width: 6


        }
    }
    
}