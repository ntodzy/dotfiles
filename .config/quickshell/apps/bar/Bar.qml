import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.UPower
import Quickshell.Services.SystemTray


import "root:/services/" as Services

import "components/" as Components

Scope {
    id: root
    property int height: 28
    property int margin: 4

    Variants {
        model: Quickshell.screens 
        delegate: WlrLayershell {
            id: bar
            required property ShellScreen modelData

            anchors {
                left: true
                right: true
                top: true
            }

            color: "transparent"
            focusable: false;
            implicitHeight: root.height
            layer: WlrLayer.Top
            screen: modelData

            surfaceFormat.opaque: false
        
            // removing this will make it go "over" the screen area
            // exclusionMode: ExclusionMode.Ignore // gives it space on the screen

            Rectangle {
                anchors.fill: parent
                anchors.topMargin: 4
                anchors.leftMargin: 4
                anchors.rightMargin: 4
                color: "transparent"

                RowLayout {
                    anchors.left: parent.left

                    Rectangle {
                        width: 24
                        height: 24
                        radius: 12
                        color: Services.Colors.primary_container

                        Text {
                            anchors.centerIn: parent
                            text: ""
                            color: Services.Colors.on_primary_container
                            font.pixelSize: 20
                        }
                    }
                    
                    Components.Workspace { }
                    Components.Tray { }
                }

                    

                RowLayout {
                    anchors.horizontalCenter: parent.horizontalCenter

                    Rectangle {
                        width: 80
                    }


                    Rectangle {
                        width: 70 
                        Layout.minimumHeight: root.height - root.margin
                        radius: 24
                        color: Services.Colors.primary

                        // Weather
                        Text {
                            anchors.centerIn: parent
                            text: "   72°F"
                        }
                    }

                    Rectangle {
                        width: 140
                        Layout.minimumHeight: root.height - root.margin
                        radius: 24
                        color: Services.Colors.primary

                        // Layout Spacer
                    }

                    Rectangle {
                        width: 10
                    }
                }

                RowLayout {
                    anchors.right: parent.right

                    Components.Network {}
                    Components.Clock {}
                    Components.Battery {}
                }
            }
            
        }
    }
}