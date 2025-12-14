pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import QtQuick

import "root:/widgets/"

import "root:/Services/" as Services

MouseArea {
    id: root
    required property SystemTrayItem modelData
    property bool isActive: false

    implicitWidth: 16
    implicitHeight: 16

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    onClicked: (event) => {
        if (event.button === Qt.LeftButton) {
            modelData.activate()
            
        } else if (modelData.hasMenu) {
            isActive = !isActive // set to active

            trayMenuAnchor.open()
        }
    }

    QsMenuAnchor {
        id: trayMenuAnchor
        menu: root.modelData.menu
        anchor.window: menuqWindow
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
            id: menuWindow
            anchor.window: topLevel

            visible: true
            color: "transparent"
            implicitWidth: root.modelData.visble ? root.modelData.minimumWidth : 1
            // implicitHeight: root.modelData.visible ? 200 : 1
            anchor.rect {
                x: icon.mapToItem(null, 0, 0).x + (icon.width - width) / 2
                y: 3 // acts as a margin
            }
        }
        


    }

    IconImage {
        id: icon
        asynchronous: true
        anchors.fill: parent
        source: {
            let icon = root.modelData.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
    }
}