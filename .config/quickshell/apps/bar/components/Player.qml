import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.Mpris

import "root:/services/" as Services


WrapperRectangle {
    function getAudioTitle() {

        // Return the current active audio title
        if (Mpris.players.values.length > 0) {
            return Mpris.players.values[0].trackTitle + " - " + Mpris.players.values[0].trackArtist;
        } else {
            return "No Player";
        }

    }

    Layout.minimumHeight: root.height - root.margin
    radius: 24
    color: Services.Colors.primary_container
    visible: Mpris.players.values.length > 0

    RowLayout {
        anchors.fill: parent
        spacing: 6

        Rectangle {
            // Padding
            width: 6
        }

        Text {
            text: Mpris.players.values[0] ? "  " + getAudioTitle() : "  No Player"
            color: Services.Colors.on_primary_container
            Layout.alignment: Qt.AlignVCenter
        }

        Rectangle {
            // Padding
            width: 6

        }
    }
}