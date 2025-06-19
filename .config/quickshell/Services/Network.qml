pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: netman
    property bool enabled: false
    property string ssid: ""
    property int signal: 0

    Process {
        id: netman_proc
        command: ["sh", "/home/todzy/dotfiles/.config/quickshell/data/network.sh"] 
        running: true
        stdout: SplitParser {
            splitMarker: " "
            onRead: (data) => {
                let split = data.trim().split("\n");
                if (split.length === 1) {
                    netman.ssid = ""
                    netman.signal = 0
                    netman.enabled = false
                    return
                }

                let lan_info = split[0].trim().split(":");
                let hw_info = split[1].trim()
                if (split.length === 2 && lan_info.length === 2) {
                    ssid = " " + lan_info[0].trim().slice(0, 5);
                    signal = parseInt(lan_info[1].trim());
                    let tmp_status =  hw_info
                    if (tmp_status === "enabled") {
                        netman.enabled = true;
                    } else if (tmp_status === "disabled") {
                        netman.enabled = false;
                    } else {
                        console.warn("Unknown network status: " + tmp_status);
                    }
                } else {
                    netman.ssid = ""
                    netman.signal = 0
                    netman.enabled = false
                }
            }
        }
    }

    Timer {
        interval: 10000
        repeat: true
        running: true
        onTriggered: {
            netman_proc.running = false;
            netman_proc.running = true;
        }
    }

    Process {
        id: disable
        command: ["nmcli", "r", "wifi", "off"]
        running: false
        stdout: SplitParser {
            onRead: (data) => {
                netman.enabled = false
                netman_proc.running = false;
            }
        }
    }

    Process {
        id: enable
        command: ["nmcli", "r", "wifi", "on"]
        running: false
        stdout: SplitParser {
            onRead: (data) => {
                netman.enabled = true
                netman_proc.running = true;
            }
        }
    }

    function toggle() {
        if (!enabled) {
            enable.running = true;
        } else {
            disable.running = true;
        }
    }
}