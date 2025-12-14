import "DashItem.qml"
import QtQuick.Effects
import Quickshell.Widgets
import QtQuick

import "root:/Services/" as Services


DashItem {
    id: root
    scale: 2
    
    property bool active: false
    property string disabled: Services.Colors.surface_variant
    property string enabled: Services.Colors.primary
    property string on_disabled: Services.Colors.on_surface_variant
    property string on_enabled: Services.Colors.on_primary
    property string hover: Services.Colors.primary_container
    property string on_hover: Services.Colors.on_primary_container

    property int radius: 24

    property string bgclr: active ? enabled : disabled
    property string txtclr: active ? on_enabled : on_disabled
    Behavior on bgclr {
        ColorAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on txtclr {
        ColorAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on rect.border.width {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    rect.color: bgclr
    rect.radius: radius
    rect.border.color: hover


    MouseArea {
        id: mousebox
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        

        onClicked: (event) => {
            if (event.button === Qt.RightButton) {
                  return // ignore
            }

            active = !active
        }
    }

    HoverHandler {
        property bool isHovered: false

        onHoveredChanged: {
            isHovered = !isHovered
            root.rect.border.width = isHovered ? 3 : 0

        }
    }



}