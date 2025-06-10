import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets


Item {
    id: root

    required property int scale;
    property alias rect: rect
    
    Layout.fillWidth: true;
    height: 16*scale
    clip: true


    WrapperRectangle {
        id: rect
        anchors {
            fill: parent
        }
    }

}