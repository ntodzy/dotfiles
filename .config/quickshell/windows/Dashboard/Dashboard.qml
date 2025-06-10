import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell

import "./DashItem.qml"
import "./DashBtn.qml"
import "./widgets" as Widgets

Variants {
    model: Quickshell.screens 
    delegate: PanelWindow {
        id: sidePanel
        required property ShellScreen modelData

        anchors {
            left: true
            top: true
            bottom: true
        }

        // exclusionMode: ExclusionMode.Ignore // switch this to make it go over the screen area
        color: "transparent"
        implicitWidth: 288

        screen: modelData
        
        Rectangle {
            anchors.fill: parent
            color: "#2c2c2c"
            border {
                color: "#00affa"
                width: 2
            }

            bottomRightRadius: 18
            topRightRadius: 18

            anchors {
                left: parent.left
                bottom: parent.bottom
                top: parent.top
                
            }

            Item {
                anchors {
                    fill: parent
                    margins: 10
                }

                GridLayout {
                    width: parent.width
                    rows: 9
                    columns: 1
                    id: controlPanel

                    RowLayout {
                        width: parent.width

                        // Profile Picture
                        Rectangle {
                            width: 48
                            height: 48
                            radius: 48
                        }

                        // Name and Uptime
                        ColumnLayout {
                            Layout.fillWidth: true
                            Text {
                                text: "John Doe"
                                color: "white"
                            }

                            Text {
                                text: "Uptime: 5h 23m"
                                color: "lightgrey"
                            }
                        }

                        // Battery will go here on mobile..
                        Rectangle {
                            width: 48
                            height: 48
                            color: "lightgrey"
                            Layout.alignment: Qt.AlignRight
                        }


                    }
                    RowLayout {
                        width: parent.width
                        height: 16*3


                        Widgets.Music {}

                    }

                    RowLayout {
                        width: parent.width

                        // Sound Bar
                        DashItem {
                            scale: 1
                            rect.color: "pink"

                            Text {
                                text: "󰕾"
                                color: "black"
                                anchors.centerIn: parent
                                font.pixelSize: 12
                            }
                        }
                    }
                    RowLayout {
                        width: parent.width

                        // Brightness Bar
                        DashItem {
                            scale: 1
                            rect.color: "grey"

                            Text {
                                text: "brightness"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 12
                            }
                        }
                    }
                    RowLayout {
                        width: parent.width

                        DashBtn {
                            color: "Green"

                            Text {
                                text: "󰖩"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                        DashBtn {
                            // BLUETOOTH
                            color: "Blue"

                            Text {
                                text: "󰂯"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }
                    }
                    
                    RowLayout {
                        width: parent.width

                        DashBtn {
                            // RECORD
                            color: "red"
                            
                            Text {
                                text: "Record"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                        DashBtn {
                            // UNKNOWN

                            color: "pink"
                            Text {
                                text: "?"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }
                    }

                    RowLayout {
                        width: parent.width

                        // TODO WEATHER PILL
                        Rectangle {
                            Layout.fillWidth: true
                            height: 50
                            color: "green"

                            Text {
                                text: "󰖨"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }
                    }

                    RowLayout {
                        width: parent.width

                        // CALENDAR
                        Rectangle {
                            Layout.fillWidth: true
                            height: 150
                            color: "orange"

                            Text {
                                text: "󰃰"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 100
                            }
                        }
                    }

                    // Power Controls
                    RowLayout {
                        width: parent.width 

                        DashBtn {
                            color: "yellow"
                            radius: 10

                            Text {
                                text: "󰤄"
                                color: "black"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                        DashBtn {
                            color: "purple"
                            radius: 10

                            Text {
                                text: "\udb81\uddfd"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                        DashBtn {
                            color: "red"
                            radius: 10

                            Text {
                                text: "\uead2"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                        DashBtn{
                            color: "red"
                            radius: 10

                            Text {
                                text: "\u23fb"
                                color: "white"
                                anchors.centerIn: parent
                                font.pixelSize: 30
                            }
                        }

                    }
                }

                // Notification Row, this fills the remaining space...

                GridLayout {
                    width: parent.width
                    height: parent.height - controlPanel.height
                    rows: 2
                    columns: 1

                    
                    anchors {
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                    }

                    RowLayout {
                        Rectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            height: 50
                            
                            color: "transparent"

                            Text {
                                text: "Notifications"
                                color: "white"
                                font.pixelSize: 20
                            }

                            Rectangle {
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                    bottom: parent.bottom
                                }
                                height: 2
                                color: "white"
                            }
                            
                        }
                    }
                
                    RowLayout {
                        Rectangle {
                            Layout.fillWidth: true
                            height: 50
                            color: "orange"
                        }
                    }
                }
            }
        }
    }
}