import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell

import "root:/services/" as Services

Rectangle {
    Layout.minimumHeight: root.height - root.margin
    Layout.minimumWidth: 135
    radius: 25
    color: Services.Colors.primary_container

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Text {
        anchors.centerIn: parent
        color: Services.Colors.on_primary_container
        text: clock.hours + ":" + (clock.minutes < 10 ? "0" + clock.minutes : clock.minutes) + " | " + Qt.formatDateTime(new Date(), "MMM dd (ddd)")
    }
}