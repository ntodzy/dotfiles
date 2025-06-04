import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Iohttps://github.com/ntodzy/dotfiles.git

import Quickshell.Services.Pipewire

import "../generic/Pill" as Pill

Item {
    id: soundPill
    property bool muted: Pipewire.defaultAudioSink?.audio.muted ?? false

    function formatVolume(volume, stat) {
        if (stat) {
            return "mute";
        }
        return `${volume} 󰕾`;
    }

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

    Connections {
        target: Pipewire.defaultAudioSink?.audio

        function onMutedChanged() {
            print("SoundPill: Muted changed to", Pipewire.defaultAudioSink?.audio.muted);

            // update the pill background color based on mute status
            soundPillBackground.color = Pipewire.defaultAudioSink?.audio.muted ? "red" : "white";
            soundPill.muted = Pipewire.defaultAudioSink?.audio.muted;

        }
    }

    MarginWrapperManager {
        margin: 0
        resizeChild: true

    }

    Rectangle {
        color: "white"
        radius: 10
        implicitHeight: 31
        id: soundPillBackground

        MarginWrapperManager {
            margin: 0
            resizeChild: true
        }

        RowLayout {
            spacing: 2

            Text {
                text: ` ${Math.floor(Pipewire.defaultAudioSink?.audio.volume * 100)}`
                color: "black"
            }
            
            Rectangle {
                color: soundPill.muted ? "darkred" : "white"
                id: soundPillIcon
                radius: 20

                MarginWrapperManager {
                    margin: 2
                    resizeChild: true
                    implicitWidth: 14
                }

                Text {
                    text: "󰕾"
                    color: "black"
                   
                    Layout.fillHeight: true
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}