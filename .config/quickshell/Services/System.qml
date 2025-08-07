pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: system

    property string hostname: "unknown"
    property string kernel: "unknown"
    property string uptime: "unknown"
    property string sleeptime: "unknown"
    property string username: "unknown"

    // Usage
    property real cpu_usage: 0.0
    property real memory_usage: 0.0
    property real disk_usage: 0.0
    property real network_usage: 0.0


    Process {
        id: init_proc
        command: ["sh", "-c", "uname -n && uname -r && whoami"]
        running: true
        stdout: StdioCollector {
            waitForEnd: true
            onStreamFinished: {
                var output = data.toString().trim().split("\n");
                system.hostname = output[0].trim();
                system.kernel = output[1].trim();
                system.username = output[2].trim();
            }
        }
    }

    Process {
        id: sys_proc
        command: ["sh", "-c", "cat /proc/uptime"]
        running: true
        stdout: StdioCollector {
            waitForEnd: true

            onStreamFinished: {
                var output = data.toString().trim().split(" ");
                if (output.length >= 2) {
                    system.uptime = uptimeToString(output[0].trim());
                    system.sleeptime = uptimeToString(output[1].trim());
                }

                // print("System Info Updated:");
                // print("Hostname: " + system.hostname);
                // print("Kernel: " + system.kernel);
                // print("Uptime: " + uptimeToString(parseInt(system.uptime)));
                // // print("Sleep Time: " + uptimeToString(parseInt(system.sleeptime)));
            }
        }
    }

    function uptimeToString(seconds) {
        var days = Math.floor(seconds / 86400);
        seconds %= 86400;
        var hours = Math.floor(seconds / 3600);
        seconds %= 3600;
        var minutes = Math.floor(seconds / 60);
        seconds %= 60;

        return `${days}d ${hours}h ${minutes}m`;
    }

    Timer {
        id: updateTimer
        interval: 1000 * 60 * 5
        running: true
        repeat: true

        onTriggered: {
            sys_proc.running = false;
            sys_proc.running = true;
        }
    }
    
}