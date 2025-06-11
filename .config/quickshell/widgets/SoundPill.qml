import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io

import Quickshell.Services.Pipewire

import "root:/generics/Pill.qml" as Pill
import "root:/Services/" as Services



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
            soundPillBackground.color = Pipewire.defaultAudioSink?.audio.muted ? Services.Colors.error_container : Services.Colors.secondary
            soundPill.muted = Pipewire.defaultAudioSink?.audio.muted;

        }
    }

    MarginWrapperManager {
        margin: 0
        resizeChild: true
    }

    WrapperRectangle {
        color: Services.Colors.secondary
        radius: 6    
        id: soundPillBackground

        margin: 0
        resizeChild: true

        RowLayout {
            spacing: 0

            Text {
                text: ` ${Math.floor(Pipewire.defaultAudioSink?.audio.volume * 100)} `
                color: soundPill.muted ? "white" : "black"
            }
            
            WrapperRectangle {
                color: soundPill.muted ? Services.Colors.on_error : Services.Colors.secondary
                id: soundPillIcon
                radius: 20

                resizeChild: true
                margin: 2

                Text {
                    text: "󰕾"
                    color: soundPill.muted ? "white" : "black"
                   
                    Layout.fillHeight: true
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}