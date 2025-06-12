import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Effects

import "./DashItem.qml"
import "./DashBtn.qml"
import "root:/windows/Dashboard/widgets" as Widgets
import "root:/Services" as Services
import "root:/Data/" as Data

Scope {
    id: root
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
                color: Services.Colors.surface_container

                border {
                    width: 1
                    color: Services.Colors.outline
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
                        rowSpacing: 8
                        id: controlPanel

                        RowLayout {
                            width: parent.width
                            spacing: 8

                            // Profile Picture
                            ClippingRectangle {
                                id: pfpClip
                                width: 48
                                height: 48
                                radius: 24
                                color: "transparent"

                                Image {
                                    id: pfpImage
                                    source: "/home/todzy/.config/assets/pfp.jpg" // Replace with your profile image path
                                    fillMode: Image.PreserveAspectCrop
                                    anchors.fill: parent
                                    smooth: true
                                }
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
                            spacing: 8
                            width: parent.width
                            height: 16*3


                            Widgets.Music {}

                        }

                        RowLayout {
                            width: parent.width
                            spacing: 8

                            // Sound Bar
                            // Brightness Bar
                            DashItem {
                                id: soundBar
                                scale: 1.25
                                rect.color: "transparent"
                                rect.radius: 0

                                Slider {
                                    id: sound_progressSlider
                                    Layout.fillWidth: true
                                    height: soundBar.height

                                    from: 0
                                    to: 1
                                    stepSize: .01

                                    // Local control state
                                    // property bool isUserDragging: false

                                    // Show current position unless the user is dragging
                                    value: Pipewire.defaultAudioSink?.audio.volume  || 0

                                    PwObjectTracker {
                                        objects: [ Pipewire.defaultAudioSink ]
                                    }

                                    Connections {
                                        target: Pipewire.defaultAudioSink?.audio
                                    }


                                
                                    onValueChanged: {
                                        Pipewire.defaultAudioSink.audio.volume = value
                                        // print("Volume set to: " + Pipewire.defaultAudioSink.audio.volume);
                                    }

                                    Rectangle{
                                        id: sound_sliderIcon
                                        implicitWidth: soundBar.height
                                        implicitHeight: implicitWidth
                                        width: implicitWidth
                                        radius: 24
                                        height: implicitHeight
                                        Text {
                                            text: ""
                                            color: Services.Colors.on_primary
                                            anchors.centerIn: parent
                                            font.pixelSize: 12
                                        }

                                        color: Services.Colors.primary
                                    }

                                    background: Rectangle {
                                            x: sound_progressSlider.leftPadding
                                            y: sound_progressSlider.topPadding + sound_progressSlider.availableHeight / 2 - height / 2
                                            implicitWidth: soundBar.width - anchors.leftMargin
                                            implicitHeight: soundBar.height
                                            width: sound_progressSlider.availableWidth - sound_sliderIcon.width - sound_progressSlider.leftPadding
                                            height: implicitHeight
                                            radius: 24
                                            color: Services.Colors.primary_container

                                            anchors.left: sound_sliderIcon.right
                                            anchors.leftMargin: 8


                                            Rectangle {
                                                width: sound_progressSlider.visualPosition * parent.width
                                                height: parent.height
                                                color: Services.Colors.primary
                                                radius: 24
                                                border.color: "transparent"

                                                Behavior on width {
                                                    NumberAnimation {
                                                        duration: 150
                                                        easing.type: Easing.InOutQuad
                                                    }
                                                }
                                            }
                                            
                                        }

                                    handle: Rectangle {
                                        x: sound_progressSlider.leftPadding + sound_progressSlider.visualPosition * (sound_progressSlider.availableWidth - width)
                                        y: sound_progressSlider.topPadding + sound_progressSlider.availableHeight / 2 - height / 2

                                        radius: 13
                                        color: sound_progressSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                                        border.color: "#bdbebf"
                                    }
                                }
                            }
                        }

                        RowLayout {
                            width: parent.width
                            spacing: 8

                            // Brightness Bar
                            DashItem {
                                id: brightnessBar
                                scale: 1
                                rect.color: "transparent"
                                rect.radius: 0

                                Slider {
                                    id: progressSlider
                                    Layout.fillWidth: true
                                    height: 16

                                    from: 0
                                    to: 100
                                    stepSize: 1

                                    // Local control state
                                    property bool isUserDragging: false

                                    // Show current position unless the user is dragging
                                    value: 50

                                    onPressedChanged: {
                                        if (!pressed && isUserDragging) {

                                        }
                                        isUserDragging = pressed;
                                    }

                                    background: Rectangle {
                                            x: progressSlider.leftPadding
                                            y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                                            implicitWidth: brightnessBar.width
                                            implicitHeight: 16
                                            width: progressSlider.availableWidth
                                            height: implicitHeight
                                            radius: 24
                                            color: Services.Colors.primary_container


                                            Rectangle {
                                                width: progressSlider.visualPosition * parent.width
                                                height: parent.height
                                                color: Services.Colors.primary
                                                radius: 24
                                                border.color: "transparent"

                                                Behavior on width {
                                                    NumberAnimation {
                                                        duration: 150
                                                        easing.type: Easing.InOutQuad
                                                    }
                                                }
                                            }
                                            
                                        }

                                    handle: Rectangle {
                                        x: progressSlider.leftPadding + progressSlider.visualPosition * (progressSlider.availableWidth - width)
                                        y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2

                                        radius: 13
                                        color: progressSlider.pressed ? "#f0f0f0" : "#f6f6f6"
                                        border.color: "#bdbebf"
                                    }
                                }

                                Text {
                                    text: ""
                                    color: Services.Colors.on_primary
                                    anchors.left: parent.left
                                    anchors.leftMargin: 8
                                    font.pixelSize: 12
                                }
                            }
                        }
                        RowLayout {
                            width: parent.width
                            spacing: 8

                            DashBtn {

                                Text {
                                    text: "󰖩"
                                    color: parent.txtclr
                                    anchors.centerIn: parent
                                    font.pixelSize: 20
                                }
                            }

                            DashBtn {
                                // BLUETOOTH
                                Text {
                                    text: "󰂯"
                                    color: parent.txtclr
                                    anchors.centerIn: parent
                                    font.pixelSize: 20
                                }
                            }
                        }
                        
                        RowLayout {
                            width: parent.width
                            spacing: 8

                            DashBtn {
                                // RECORD
                                // color: Services.Colors.surface_variant
                                
                                Text {
                                    text: "󰦚"
                                    color: parent.txtclr
                                    anchors.centerIn: parent
                                    font.pixelSize: 20
                                }
                            }

                            DashBtn {
                                // UNKNOWN

                                Text {
                                    text: "?"
                                    color: parent.txtclr
                                    anchors.centerIn: parent
                                    font.pixelSize: 20
                                }
                            }
                        }

                        RowLayout {
                            width: parent.width
                            spacing: 8

                            // TODO WEATHER PILL
                            Rectangle {
                                Layout.fillWidth: true
                                height: 64
                                color: Services.Colors.tertiary

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
                            spacing: 8

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
                            spacing: 8
                            width: parent.width 

                            DashBtn {
                                radius: 10
                                disabled: Services.Colors.primary

                                Text {
                                    text: "󰤄"
                                    color: Services.Colors.on_primary
                                    anchors.centerIn: parent
                                    font.pixelSize: 30
                                }
                            }

                            DashBtn {
                                disabled: Services.Colors.primary
                                radius: 10

                                Text {
                                    text: "\udb81\uddfd"
                                    color: Services.Colors.on_primary
                                    anchors.centerIn: parent
                                    font.pixelSize: 30
                                }
                            }

                            DashBtn {
                                disabled: Services.Colors.primary
                                radius: 10

                                Text {
                                    text: "\uead2"
                                    color: Services.Colors.on_primary
                                    anchors.centerIn: parent
                                    font.pixelSize: 30
                                }
                            }

                            DashBtn{
                                disabled: Services.Colors.primary
                                radius: 10

                                Text {
                                    text: "\u23fb"
                                    color: Services.Colors.on_primary
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
}
