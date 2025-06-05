import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io


import "../generics/Pill.qml" as Pill
import "../data/" as Data

Item {
    id: soundPill
    MarginWrapperManager {
        margin: 0
        resizeChild: true
    }

    WrapperRectangle {
        color: "white"
        radius: 6

        id: soundPillBackground

        // wrapper
        margin: 0
        resizeChild: true

        RowLayout {
            spacing: 0

            Text {
                text: `${Data.Network.ssid}`
                color: "black"
            }
            
            WrapperRectangle {
                color: soundPill.muted ? "darkred" : "white"
                id: soundPillIcon
                radius: 20
                resizeChild: true
                margin: 2

                Text {
                    text: "󰤨 "
                    color: "black"
                   
                    Layout.fillHeight: true
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}