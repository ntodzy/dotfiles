import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.Pipewire

import "root:/services/" as Services

WrapperRectangle {

    Layout.minimumHeight: root.height - root.margin
    radius: 24
    color: Services.Colors.primary_container

    property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onMutedChanged() {
            print("Audio: Muted changed to", Pipewire.defaultAudioSink?.audio.muted);

            // update the pill background color based on mute status
            audioText.color = Pipewire.defaultAudioSink?.audio.muted ? Services.Colors.error : Services.Colors.on_primary_container;
            audioPill.muted = Pipewire.defaultAudioSink?.audio.muted;

        }
    }

    
    RowLayout {
        anchors.fill: parent
        spacing: 6

        Rectangle {
            // Padding
            width: 6
        }

        Text {
            id: audioText
            anchors.centerIn: parent
            text: muted ? "󰝟" : `󰕾  ${Math.floor(Pipewire.defaultAudioSink?.audio.volume * 100)}`
            color: Services.Colors.on_primary_container
            Layout.alignment: Qt.AlignVCenter
        }

        Rectangle {
            // Padding
            width: 6
    
        }

        MouseArea {
            id: audioMouseArea
            anchors.fill: parent
            hoverEnabled: true
            scrollGestureEnabled: true
            property bool lock: false

            onClicked: {
                if (Pipewire.defaultAudioSink?.audio) {
                    Pipewire.defaultAudioSink.audio.muted = !Pipewire.defaultAudioSink.audio.muted;
                }
            }

            Timer {
                id: lockTimer
                interval: 50 // milliseconds
                repeat: false
                
                onTriggered: audioMouseArea.lock = false;
            }

            onWheel: function(event)  {
                if (lock) {
                    event.accepted = true;
                    return;
                }

                lock = true;
                lockTimer.start();


                if (event.angleDelta.y > 0) {
                    // Scroll up - increase volume
                    Pipewire.defaultAudioSink.audio.volume = Math.min((Pipewire.defaultAudioSink?.audio.volume ?? 0) + 0.01, 1.0);
                } else {
                    // Scroll down - decrease volume
                    Pipewire.defaultAudioSink.audio.volume = Math.max((Pipewire.defaultAudioSink?.audio.volume ?? 0) - 0.01, 0.0);
                }
            }
        }
    }
}