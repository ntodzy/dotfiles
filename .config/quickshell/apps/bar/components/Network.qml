import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets

import Quickshell.Bluetooth

import "root:/services/" as Services

WrapperRectangle {
    function returnBluetoothName() {
        // Count number of connected devices
        var connectedDevices = 0;

        for (var i = 0; i < Bluetooth.devices.values.length; i++) {
            if (Bluetooth.devices.values[i].connected) {
                connectedDevices += 1;
            }
        }

        if (connectedDevices > 1) {
            return connectedDevices + " Devices";
        } else  if (connectedDevices > 0) {
            return Bluetooth.devices.values[0].name.slice(0,20);
        } else {
            return "No Device";
        }
    }

    Layout.minimumHeight: root.height - root.margin
    radius: 25
    color: Services.Colors.primary_container

    RowLayout {
        id: networkinfo
        anchors.verticalCenter: parent.verticalCenter
        Layout.alignment: Qt.AlignVCenter
        spacing: 6

        Rectangle {
            // Padding
            width: 6
        }

        Text {
            Layout.alignment: Qt.AlignVCenter
            visible: Bluetooth.devices.length > 0 && Bluetooth.devices.values.some(d => d.connected)
            // text:  Bluetooth.devices.length > 0 ? "󰂯 " + Bluetooth.devices[0] : "󰂯 hi"
            text: "󰂯 " + returnBluetoothName()
            color: Services.Colors.on_primary_container
            font.pixelSize: 12
        }

        Text {
            visible: Services.Network.enabled
            Layout.alignment: Qt.AlignVCenter
            text: "  " + Services.Network.ssid.slice(0,8)
            color: Services.Colors.on_primary_container
        }

        Text {
            text: " "
        }
    }
}

