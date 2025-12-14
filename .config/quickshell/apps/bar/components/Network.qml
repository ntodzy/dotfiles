import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets

import Quickshell.Bluetooth

import "root:/services/" as Services

WrapperRectangle {
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
            visible: Bluetooth.defaultAdapter.enabled
            text:  Bluetooth.devices[0] ? "󰂯 " + Bluetooth.devices[0].name : "󰂯 "
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

