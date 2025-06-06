
pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: netman
    property string ssid: "DISCON"
    property int signal: 0

    property int bt_status: 0
    property int bt_conn: 0

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
        interval: 1000 * 10 // 10s.. i wonder if theres a callback for this
        repeat: true
        running: true
        onTriggered: netman_proc.running = true;
    }

    Process {
        id: netman_btproc
        command: ["sh", "bluetooth.sh"]
        running: true
        stdout: SplitParser {
            onRead: (data) => { 
                let split = data.trim().split(",");
                bt_status = parseInt(split[0].trim());
                bt_conn = parseInt(split[1].trim());

                // print(`Bluetooth Status: ${bt_status}, Connected Devices: ${bt_conn}`);
            }
        }
    }

    Timer {
        interval: 1000 * 10 // 10s
        repeat: true
        running: true
        onTriggered: netman_btproc.running = true;
    }

    property string wifiIcon: "󰤨"
}