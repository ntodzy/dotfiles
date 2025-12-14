import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets

import "root:/services/" as Services


WrapperRectangle {
    Layout.minimumHeight: root.height - root.margin
    radius: 25
    color: Services.Colors.primary_container

    // Hyprland Workspace Buttons
    Row {
        spacing: 6


        height: parent.height
        Rectangle {
            // Spacer
            width: 8
            height: 18
            radius: 18
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
        }
        
        Repeater {
            model: Hyprland.workspaces
            Component.onCompleted: parent.spacing = 2
            
            Rectangle {
                width: modelData.active ? 32 : 12
                height: 12
                radius: 12
                color: modelData.active ? Services.Colors.primary : Services.Colors.on_primary_container
                anchors.verticalCenter: parent.verticalCenter
                visible: modelData.id >= 0

                // Text {
                //     anchors.centerIn: parent
                //     text: modelData.id
                //     color: Services.Colors.on_primary
                // }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Hyprland.dispatch("workspace " + (modelData.id) )
                    }
                }
            }
        }

        Rectangle {
            // Spacer
            width: 8
            height: 18
            radius: 18
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter
        }

    }
}