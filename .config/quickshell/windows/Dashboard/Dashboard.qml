import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Effects

import "DashItem.qml"
import "DashBtn.qml"
import "root:/windows/Dashboard/widgets" as Widgets
import "root:/Services" as Services

import "root:/windows/Dashboard/Screens/Dashboard/" as Dashboard
import "root:/windows/Dashboard" as DashboardRoot



Scope {
    id: root


    Variants {
        model: Quickshell.screens 
        delegate: PanelWindow {
            id: sidePanel
            required property ShellScreen modelData

            property real sz_expanded: 288
            property real sz_collapsed: 16

            anchors {
                left: true
                top: true
                bottom: true
            }

            exclusionMode: ExclusionMode.Ignore // switch this to make it go over the screen area
            color: "transparent"
            screen: modelData
            implicitWidth: sz_collapsed // Collapsed width

            Rectangle {
                id: dashHint
                width: 0
                height: parent.height / 1.5
                anchors {
                    left: parent.left
                    verticalCenter: parent.verticalCenter
                }
                color: Services.Colors.surface_container

                topRightRadius: 16
                bottomRightRadius: 16
                border.width: 1
                border.color: Services.Colors.outline

                Behavior on width {
                    NumberAnimation { duration: 100; from: 5; easing.type: Easing.InOutQuad }
                }
            }

            MouseArea {
                id: vertSwipeArea
                implicitHeight: parent.height
                implicitWidth: sidePanel.sz_collapsed
                property real startX: 0
                property bool swiped: false
                propagateComposedEvents: true

                hoverEnabled: true

                onEntered: {
                    dashHint.visible = true
                    dashHint.width = sidePanel.sz_collapsed
                }
                onExited: {
                    dashHint.width = 0
                }

                onPressed: function(mouse) {
                    startX = mouse.x
                    swiped = false
                }
                onReleased: function(mouse) {
                    if (!swiped) {
                        // Reset if not swiped
                        dashRow2.visible = false
                    }
                }
                onPositionChanged: function(mouse) {
                    if (!swiped && (mouse.x - startX) > 40) { // adjust threshold as needed
                        dashRow2.visible = true
                        swiped = true
                        sidePanel.implicitWidth = sidePanel.sz_expanded; // Expand the panel
                    }
                }
            }

            GridLayout {
                width: parent.width
                height: parent.height
                rows: 2
                columns: 1
                rowSpacing: 5

                // First row: dashRow with swipe detection
                Item {
                    id: dashRowContainer
                    width: parent.width
                    height: 32
                    Layout.alignment: Qt.AlignTop

                    // RowLayout {
                    //     id: dashRow
                    //     anchors.fill: parent
                    //     implicitWidth: parent.width
                    //     Layout.preferredHeight: 32
                    //     Layout.alignment: Qt.AlignTop

                    //     DashboardRoot.Notification {}
                    // }

                    MouseArea {
                        id: swipeArea
                        anchors.fill: parent
                        property real startY: 0
                        property bool swiped: false
                        propagateComposedEvents: true
                        

                        onPressed: function(mouse) {
                            startY = mouse.y
                            swiped = false
                        }
                        onReleased: function(mouse) {
                            if (!swiped) {
                                // Reset if not swiped
                                dashRow2.isActive = false; // Reset the second row to inactive
                            }
                        }
                        onPositionChanged: function(mouse) {
                            if (!swiped && (mouse.y - startY) > 40) { // adjust threshold as needed
                                dashRow2.visible = true
                                dashRow2.isActive = true; // Set the second row as active
                            }
                        }
                    }
                }
                // Second row: dashRow2, initially hidden
                RowLayout {
                    id: dashRow2
                    visible: false
                    opacity: 0
                    implicitWidth: parent.width
                    Layout.preferredHeight: parent.height - 8

                    property bool isActive: false

                    Behavior on opacity {
                        NumberAnimation { duration: 250; easing.type: Easing.InOutQuad }
                    }
                    

                    onVisibleChanged: {
                        if (visible) {
                            opacity = 1
                            sidePanel.implicitWidth = 288; // Expand the panel
                        } else {
                            opacity = 0
                            sidePanel.implicitWidth = 32; // Collapse the panel
                        }
                    }

                    MouseArea {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        propagateComposedEvents: true

                        property real startX: 0 

                        onPressed: function(mouse) {
                            startX = mouse.x
                            
                        }
                        onPositionChanged: function(mouse) {
                            // print("difference:" + (mouse.x - startX))
                            if ((mouse.x - startX) < parent.width * -4/9) { // perhaps change to velocity based
                                // print("Mouse moved to:" + mouse.x)
                            
                                dashRow2.visible = false

                            }
                        }
                        cursorShape: Qt.PointingHandCursor

                        Dashboard.Dashboard {}
                        Dashboard.BTPanel {
                            visible: Services.ScreenManager.bt_active
                        }

                    }

                }
            }

   
        }
    }
}
