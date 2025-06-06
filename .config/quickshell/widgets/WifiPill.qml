import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io

import "root:/data/" as Data

Item {
    id: soundPill

    MarginWrapperManager {
        margin: 0
        resizeChild: true
    }

    WrapperRectangle {
        color: "white"
        radius: 6

        id: networkPillBackground

        // wrapper
        margin: 0
        resizeChild: true

        RowLayout {
            spacing: 0
            HoverHandler {
                id: networkPillHover
                onHoveredChanged: {
                    wifiSSID.visible = networkPillHover.hovered;
                }
            }

            Text {
                id: wifiSSID
                text: `${Data.Network.ssid}`
                color: "black"
                visible: false
            }


            WrapperRectangle {
                color: "white"
                id: soundPillIcon
                radius: 6
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