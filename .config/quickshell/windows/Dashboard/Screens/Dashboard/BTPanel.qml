import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import Quickshell.Services.UPower
import Quickshell.Bluetooth

import Quickshell.Io

import QtQuick.Effects

import "root:/windows/Dashboard/widgets" as Widgets
import "root:/Services" as Services

Rectangle {
    implicitHeight: parent.height
    implicitWidth: 288
    color: Services.Colors.surface_container

    border {
        width: 1
        color: Services.Colors.outline
    }


    bottomRightRadius: 18
    topRightRadius: 18

    Item {
        anchors {
            fill: parent
            margins: 10
        }

        width: parent.width

        GridLayout {
            width: parent.width
            rows: 3
            columns: 1
            rowSpacing: 8
            id: bluetoothPanel


            RowLayout {
                width: parent.width
                spacing: 8

                // Name and Uptime
                ColumnLayout {
                    Layout.fillWidth: true
                    Text {
                        text: "󰂯 Bluetooth"
                        color: Services.Colors.on_surface_variant
                        font.pixelSize: 24
                    }
                }


                Rectangle {
                    color: "transparent"

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignRight

                    ColumnLayout {
                        width: parent.width
                        Layout.alignment: Qt.AlignRight

                        Button {
                            text: "X"
                            onClicked: Services.ScreenManager.bt_active = false
                            Layout.alignment: Qt.AlignRight
                        }
                    }
                }
            }

            RowLayout {
                width: parent.width

                Rectangle {
                    Layout.fillWidth: true
                    height: 2
                    
                    color: Services.Colors.primary
                }
            }

            RowLayout {
                width: parent.width

                Text {
                    text: Bluetooth.defaultAdapter.name
                    color: "white"
                }
                Text {
                    text: `Discovering? ${Bluetooth.defaultAdapter.discovering}`
                    color: "white"
                }
            }

            RowLayout {
                width: parent.width

                ListView {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.preferredHeight: 675

                    clip: true
                    spacing: 8
                    model: Bluetooth.defaultAdapter.devices

                    delegate: ItemDelegate {
                        implicitHeight: 48
                        width: parent.width

                        required property BluetoothDevice modelData

                        Rectangle {
                            width: parent.width
                            height: 48
                            color: Services.Colors.on_primary

                            ColumnLayout {
                                Text {
                                    text: `${modelData.name} - ${modelData.state}` //  -(${modelData.address})
                                    color: Services.Colors.primary
                                }
                                Text {
                                    text: modelData.connected ? "Connected" : "Not Connected"
                                    color: modelData.connected ? "green" : "red"
                                }
                                Text {
                                    text: modelData.paired ? "Paired" : "Not Paired"
                                    color: modelData.paired ? "green" : "red"
                                }
                                Text {
                                    text: modelData.batteryAvailable ? `Battery: ${modelData.battery * 100}%` : ""
                                    color: "white"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}