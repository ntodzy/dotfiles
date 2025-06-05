
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: netman
    property string ssid: "DISCON"
    property int signal: 0;

    Process {
        id: netman_proc
        command: ["sh", "network.sh"] // For some reason this only works with relative path
        running: true
        stdout: SplitParser {
            onRead: (data) => { 
                let split = data.trim().split(":");
                if (split.length === 2) {
                    ssid = " " + split[0].trim().slice(0, 5); // Limit SSID to 3 characters
                    signal = parseInt(split[1].trim());
                } else {
                    ssid = " DISCON";
                    signal = 0;
                }
            }
        }
    }

    Timer {
        interval: 1000 * 5 // 5 seconds
        repeat: true
        running: true
        onTriggered: netman_proc.running = true;

    }

    property string wifiIcon: "󰤨"
}