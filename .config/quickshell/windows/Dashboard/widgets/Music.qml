import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects

import Quickshell
import Quickshell.Widgets

import Quickshell.Services.Mpris

import "root:/windows/Dashboard/" as Dashboard
import "root:/Services/" as Services




Dashboard.DashItem { // just a fancy wrapper for an item and a few set properties
    width: parent.width  
    scale: 6

    property int idx: 0 // Index of the Mpris player to display
    rect.color: "transparent" // Make the background transparent to show the Image

    // Create an Image to display the background
    ClippingRectangle {
        id: clip
        anchors.fill: parent
        color: "black"
        radius: 24
        
        clip: true

        // border.width: 1 * scale
        // border.color: "black"

        layer.enabled: true
        layer.smooth: true

        // Background image for the Mpris player
        Image {
            id: playerArt
            anchors.fill: parent
            source: Mpris.players.values[idx] ? Mpris.players.values[idx].trackArtUrl : ""
            fillMode: Image.PreserveAspectCrop
            // visible: false
            opacity: 0.5 // Semi-transparent background
        }

    }


    MouseArea {
        id: musicScrollBox
        anchors.fill: parent
        scrollGestureEnabled: true

        property bool lock: false

        // Timer to prevent multiple scroll events
        Timer {
            id: lockTimer
            interval: 500 // milliseconds
            repeat: false
            
            onTriggered: musicScrollBox.lock = false;
        }

        onWheel: function(event) {
            if (lock) {
                event.accepted = true;
                return;
            }

            lock = true;
            lockTimer.start();

            if (event.angleDelta.y > 0) {
                idx = (idx + 1) % Mpris.players.values.length; // Scroll up
                // print("Up")
            } else {
                // print("Down")
                idx = (idx - 1 + Mpris.players.values.length) % Mpris.players.values.length; // Scroll down 
                
            }

            event.accepted = true;
        }
    }

    GridLayout {
        columns: 1
        anchors.fill: parent
        anchors.margins: 10

        RowLayout {
            Layout.fillWidth: true
            
            Text {
                Layout.fillWidth: true
                text: Mpris.players.values[idx] ? Mpris.players.values[idx].trackTitle.slice(0,40) : "No Music Playing"
                color: "white"
                font.pixelSize: 12 * scale
                Layout.alignment: Qt.AlignLeft
            }
        }

        RowLayout {
            Layout.fillWidth: true

            Text {
                text: Mpris.players.values[idx] ? Mpris.players.values[idx].trackArtist.slice(0,22) : ""
                color: "white"
                font.pixelSize: 10 * scale
                Layout.alignment: Qt.AlignLeft
            }
        }

        RowLayout {
            width: parent.width
            height: 16

        Slider {
            id: progressSlider
            Layout.fillWidth: true
            height: 8 * scale

            from: 0
            to: Mpris.players.values[idx] ? Mpris.players.values[idx].length : 100
            stepSize: 1

            // Local control state
            property bool isUserDragging: false

            // Show current position unless the user is dragging
            value: isUserDragging
                ? progressSlider.value // preserve current drag position
                : (Mpris.players.values[idx] ? Mpris.players.values[idx].position : 0)

            onPressedChanged: {
                if (!pressed && isUserDragging && Mpris.players.values[idx]) {
                    // Send seek request only when user releases the slider

                    Mpris.players.values[idx].position = value;
                }
                isUserDragging = pressed;
            }

            background: Rectangle {
                    x: progressSlider.leftPadding
                    y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                    implicitWidth: 200
                    implicitHeight: 4
                    width: progressSlider.availableWidth
                    height: implicitHeight
                    radius: 2
                    color: Services.Colors.tertiary
                    opacity: 0.5

                    Rectangle {
                        width: progressSlider.visualPosition * parent.width
                        height: parent.height
                        color: Services.Colors.on_tertiary
                        radius: 2

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

            Timer {
                id: progressTimer
                interval: 3000 // Update every second
                running: true
                repeat: true

                onTriggered: {
                    // print(Mpris.players.values[idx].position / Mpris.players.values[idx].length * 100, "%")
                    if (Mpris.players.values[idx].isPlaying) {
                        progressSlider.value = Mpris.players.values[idx].position;
                    }
                }
            }
        }

        RowLayout {
            Layout.alignment: Qt.AlignHCenter

            Button {
                id: previous
                text: ""
                font.pixelSize: 16 * scale
                visible: Mpris.players.values[idx].canGoPrevious
                onClicked: Mpris.players.values[idx] ? Mpris.players.values[idx].previous() : null
                background: Rectangle {
                    color: "transparent"
                    radius: 6 * scale
                }

                contentItem: Text {
                    text: previous.text
                    font: previous.font
                    opacity: enabled ? 1.0 : 0.3
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }

            Button {
                id: playpause
                text: Mpris.players.values[idx] && Mpris.players.values[idx].isPlaying ? "" : ""
                font.pixelSize: 16 * scale
                onClicked: Mpris.players.values[idx] ? Mpris.players.values[idx].togglePlaying() : null

                background: Rectangle {
                    color: "transparent"
                    radius: 6 * scale
                }

                contentItem: Text {
                    text: playpause.text
                    font: playpause.font
                    opacity: enabled ? 1.0 : 0.3
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }

            Button {
                id: next
                text: ""
                font.pixelSize: 16 * scale
                onClicked: Mpris.players.values[idx].canGoNext ? Mpris.players.values[idx].next() : null
                visible: Mpris.players.values[idx].canGoNext

                background: Rectangle {
                    color: "transparent"
                    radius: 6 * scale
                }

                contentItem: Text {
                    text: next.text
                    font: next.font
                    opacity: enabled ? 1.0 : 0.3
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
            }
        }
    }
}