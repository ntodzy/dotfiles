pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: brightnessManager
    property int brightness: 75
    property int maxBrightness: 100
    property int percentage: brightness / maxBrightness * 100

    Timer {
        id: updateTimer
        interval: 250 // Update every second
        running: true
        repeat: true
        onTriggered: {
            brightness_proc.running = true;
            max_brightness_proc.running = true;
        }
    }

    Process {
        id: brightness_proc
        command: ["brightnessctl", "get"]
        running: true
        stdout: StdioCollector {
            waitForEnd: true
            onStreamFinished: {
                let split = text.trim();
                brightness = parseInt(split);
            }
        }
    }
    
    Process {
        id: max_brightness_proc
        command: ["brightnessctl", "max"]
        running: true
        stdout: SplitParser {
            onRead: (data) => {
                maxBrightness = parseInt(data.trim());
            }
        }
    }

    Process {
        id: set_brightness_proc
        command: ["brightnessctl", "set", "100%"]
        running: false
        stdout: SplitParser {
            onRead: (data) => {
                brightness = 100; // Assuming setting to 100% for simplicity
            }
        }
    }

    function setBrightness(value) {
        print("Setting brightness to " + value + "%");
        set_brightness_proc.command = ["brightnessctl", "set", value + "%"];
        set_brightness_proc.running = true;
    }


}