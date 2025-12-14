import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

import "root:/services/" as Services

Rectangle {
    implicitWidth: trayrow.implicitWidth + 2*root.margin
    implicitHeight: root.height - root.margin
    color: Services.Colors.primary_container
    radius: 25
    
    RowLayout {
        id: trayrow
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Repeater {
            model: SystemTray.items
            

            delegate: MouseArea {
                width: 20
                height: 20
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.AllButtons

                onPressed: function(mouse) {
                    console.log("event button:", mouse.button);

                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate();
                    } else if (mouse.button === Qt.RightButton && modelData.hasMenu) {
                        trayMenuAnchor.open();
                    }
                }

                Image {
                    id: icon
                    anchors.fill: parent
                    source: modelData.icon
                    fillMode: Image.PreserveAspectFit
                }
                
                QsMenuAnchor {
                    id: trayMenuAnchor
                    menu: modelData.menu
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
                        visible: true
                        color: "transparent"

                        implicitWidth: modelData.visible ? modelData.minimumWidth : 1
                        anchor.rect {
                            x: icon.mapToItem(null, 0, 0).x + (icon.width - width) / 2
                            y: 3 // acts as a margin
                        }   
                        
                    }
                }
            }
        }
    }
}
