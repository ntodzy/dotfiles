import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell

Item {
    RowLayout {
    anchors {
        top: controlPanel.bottom // remember to the LAST item in the control center
    }

    Text {
        text: "Notifications"
        color: "white"
    }
}
}