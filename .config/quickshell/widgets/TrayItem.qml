pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick

import "root:/widgets/"

MouseArea {
    id: root
    required property SystemTrayItem modelData

    implicitWidth: 20
    implicitHeight: 20

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onClicked: (event) => {
        if (event.button === Qt.LeftButton) {
            print(bar.x)
            modelData.activate()
            
        } else if (modelData.hasMenu) {
            trayMenuAnchor.open()
        }
    }

    QsMenuAnchor {
        id: trayMenuAnchor
        menu: root.modelData.menu
        anchor.window: parentWindow
    }

    PanelWindow {
        id: topLevel
        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: 0


        PopupWindow {
            id: parentWindow
            anchor.window: topLevel
            color: "transparent"
            anchor.rect {
                x: icon.mapToItem(null, 0, 0).x + (icon.width - width) / 2
                y: 3 // acts as a margin
            }
            
            visible: true
        }
    }

    IconImage {
        id: icon
        asynchronous: true
        anchors.fill: parent
        source: `${iconInterface(modelData.id)}`
    }
}