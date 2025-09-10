 import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.UPower

import "root:/widgets/" as Widgets
import "root:/Services/" as Services

Scope {
    id: root
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
            implicitHeight: 32
            layer: WlrLayer.Top
            screen: modelData

            surfaceFormat.opaque: false
            
             // removing this will make it go "over" the screen area
            // exclusionMode: ExclusionMode.Ignore // gives it space on the screen
            mask: Region {
                Region {
                    item: notch
                }
            }

            WrapperRectangle {
                id: notch
                width: 600
                height: 32
                bottomLeftRadius: 25
                bottomRightRadius: 18
                anchors.horizontalCenter: parent.horizontalCenter
                color: Services.Colors.surface_container

                
                RowLayout {
                    // LEFT
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
    
                        color: "transparent"

                        RowLayout {
                            anchors {
                                left: parent.left
                                leftMargin: 10
                                verticalCenter: parent.verticalCenter
                            }
                            spacing: 5

                            // items
                            Widgets.Tray {}
                        }
                    }

                    // CENTER
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"

                        // items
                        Widgets.Clock {}
                    }
                    
                    // RIGHT
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        
                        color: "transparent"

                        RowLayout {
                            anchors {
                                right: parent.right
                                rightMargin: 10
                                verticalCenter: parent.verticalCenter

                            }
                            layoutDirection: Qt.RightToLeft
                            spacing: 5

                            Item {
                                id: batteryPill

                                MarginWrapperManager {
                                    margin: 0
                                    resizeChild: true
                                }

                                WrapperRectangle {
                                    color: Services.Colors.primary
                                    radius: 6

                                    id: networkPillBackground

                                    // wrapper
                                    margin: 0
                                    resizeChild: true

                                    RowLayout {
                                        spacing: 0
                                        HoverHandler {
                                            id: batteryPillHover
                                            onHoveredChanged: {
                                                batteryPct.visible = batteryPillHover.hovered;
                                            }
                                        }


                                        Text {
                                            id: batteryPct
                                            text: ` ${Math.floor(UPower.displayDevice.percentage * 100)}%`
                                            color: Services.Colors.on_secondary
                                            visible: false
                                        }                                     

                                        WrapperRectangle {
                                            color: Services.Colors.primary
                                            id: soundPillIcon
                                            radius: 6
                                            resizeChild: true
                                            margin: 2

                                            Text {
                                                text: Services.Icon.batteryIcons[UPower.displayDevice.iconName]
                                                color: Services.Colors.on_secondary
                                            
                                                Layout.fillHeight: true
                                                horizontalAlignment: Text.AlignHCenter
                                            }

                                        }
                                    }
                                }
                            }
                            Widgets.BluetoothPill {}
                            Widgets.WifiPill {}
                            
                        }
                    }
                }
            }
        }
    }
}