pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: btman
    property int status: 0
    property int connected: 0

    Timer {
        interval: 1000 * 10 // 10s
        repeat: true
        running: true
        onTriggered: netman_btproc.running = true;
    }

    Process {
        id: netman_btproc
        command: ["sh", "/home/todzy/dotfiles/.config/quickshell/data/bluetooth.sh"]
        running: true
        stdout: SplitParser {
            onRead: (data) => { 
                let split = data.trim().split(",");
                status = parseInt(split[0].trim());
                connected = parseInt(split[1].trim());
            }
        }
    }

    Process {
        id: disable_bt
        command: ["bluetoothctl", "power", "off"]
        running: false
        stdout: SplitParser {
            onRead: (data) => {
                btman.status = 0
                netman_btproc.running = false;
            }
        }
    }

    Process {
        id: enable_bt
        command: ["bluetoothctl", "power", "on"]
        running: false
        stdout: SplitParser {
            onRead: (data) => {
                netman_btproc.running = true;
            }
        }
    }

    function toggle() {

        if (status === 0) {
            print("Enabling Bluetooth");
            enable_bt.running = true;
        } else {
            print("Disabling Bluetooth");
            disable_bt.running = true;
        }
    }
}