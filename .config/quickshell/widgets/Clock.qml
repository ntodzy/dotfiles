import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick.Layouts

import "root:/data/" as Data

Item {
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        rightMargin: 10
        
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }


    MarginWrapperManager {
        margin: 5
        resizeChild: true
    }

    id: clockWidget
    Text {
        id: timeText
        anchors.centerIn: parent
        color: "white"
        font.bold: true
        font.pixelSize: 12
        text: Qt.formatDateTime(clock.date, "MMM d - HH:mm") // ap:=am/pm,
    }
}
