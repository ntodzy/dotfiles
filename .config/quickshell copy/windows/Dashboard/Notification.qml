import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick.Effects

import "root:/Services/" as Services




WrapperRectangle {
    Layout.preferredHeight: 32
    color: Services.Colors.surface_container
    bottomRightRadius: 16
    margin: 6

    border {
        width: 1
        color: Services.Colors.outline
    }

    

    RowLayout {
        width: parent.width
        height: parent.height
        Layout.alignment: Qt.AlignVCenter

        WrapperRectangle {
            Layout.alignment: Qt.AlignVCenter
            color: Services.Colors.primary_container
            margin: 4
            radius: 8

            RowLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                Repeater {
                    model: Hyprland.workspaces.values
                    delegate: Rectangle {
                        width: 20
                        height: 10
                        radius: 5
                        color: model.active ? Services.Colors.primary : "transparent"
                        Layout.alignment: Qt.AlignVCenter
                        visible: model.id > 0

                        Text {
                            anchors.centerIn: parent
                            text: model.name
                            color: model.active ? Services.Colors.on_primary : Services.Colors.on_surface
                            font.bold: model.active
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: Hyprland.dispatch(`workspace ${model.id}`)
                            cursorShape: Qt.PointingHandCursor
                        }
                    }
                }
            }
        }
      
    }
}