import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets

import "root:/Services/" as Services

Item {
    id: root

    required property double scale;
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