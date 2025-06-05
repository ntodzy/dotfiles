import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import "MouseArea.qml"
import "./widgets/" as Widgets

Scope {
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
            implicitHeight: 36
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

            Rectangle {
                id: notch
                width: 600
                height: 36
                bottomLeftRadius: 25
                bottomRightRadius: 18
                anchors.horizontalCenter: parent.horizontalCenter
                color: "blue"

                ///////////// BAR 
                RowLayout {
                    width: parent.width
                    height: parent.height

                    // LEFT
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
    
                        color: "transparent"
                      
                        height: 30

                        Text {
                            text: "Quickshell"
                            color: "black"
                            
                            font.pixelSize: 20
                            anchors {
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 10
                            }
                        }
                    }

                    // CENTER
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "transparent"

                        // items
                        Widgets.Clock {} // this warns 
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

                            
                    
                            Widgets.SoundPill {
                            }

                            Widgets.WifiPill {

                            }
                        }
                    }
                }
                ///////////// END BAR
            }

        
        }


    }
}

