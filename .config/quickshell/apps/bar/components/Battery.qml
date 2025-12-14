import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell

import "root:/services/" as Services

Rectangle {
    Layout.minimumHeight: root.height - root.margin
    width: batteryinfo.implicitWidth + 10
    radius: 25
    color: Services.Colors.primary_container
    visible: UPower.hasBattery

    RowLayout {
        id: batteryinfo
        anchors.verticalCenter: parent.verticalCenter
        Layout.alignment: Qt.AlignVCenter
        spacing: 6

        Text {
            anchors.verticalCenter: parent.verticalCenter
            Layout.alignment: Qt.AlignVCenter
            text: "   " + "100" + "%"
            color: Services.Colors.on_primary_container
        }
    }
}
