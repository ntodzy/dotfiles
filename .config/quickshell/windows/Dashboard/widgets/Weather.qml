import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import QtQuick.Effects

import "root:/Services/" as Services

Rectangle {
    color: Services.Colors.primary_container
    radius: 8
    border.width: 1
    border.color: Services.Colors.outline
    Layout.fillWidth: true
    height: 64

    SwipeView {
        id: view

        currentIndex: 0
        anchors.fill: parent
        clip: true

        Item {
            id: firstPage
            RowLayout {
                height: parent.height
                spacing: 8

                Text {
                    Layout.fillWidth: true
                    Layout.preferredWidth: 48
                    text: "󰖨"
                    color: "white"
                    Layout.alignment: Qt.AlignVCenter
                    Layout.leftMargin: 8
                    font.pixelSize: 48
                }

                ColumnLayout {
                    Layout.fillWidth: true

                    RowLayout {
                        Text {
                            text: Services.Weather.temperature_f + "°F"
                            color: Services.Colors.on_primary_container
                            font.pixelSize: 16
                        }

                        Text {
                            text: `(${Services.Weather.feelslike_f}°F)`
                            color: Services.Colors.on_primary_container
                            font.pixelSize: 10
                            Layout.alignment: Qt.AlignVTop
                        }
                    }

                    Text {
                        text: Services.Weather.location
                        color: Services.Colors.on_primary_container
                        font.pixelSize: 10
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    
                    Text {
                        text: `󰖌  ${Services.Weather.humdity}`
                        color: Services.Colors.on_primary_container
                        font.pixelSize: 12
                    }

                    Text {
                        text: `  ${Services.Weather.wind_speed_mph}mph ${Services.Weather.wind_dir}`
                        color: Services.Colors.on_primary_container
                        font.pixelSize: 12
                    }

                    Text {
                        text: `󱪀  ${Services.Weather.dewpoint_f}`
                        color: Services.Colors.on_primary_container
                        font.pixelSize: 12
                    }
                }
                
            }
        }
        Item{
            id: secondPage

            RowLayout {
                height: parent.height
                spacing: 8

                Repeater {
                    model: 5

                    delegate: ColumnLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignVCenter

                        Text {
                            text: "󰖨"
                            color: Services.Colors.on_surface
                            font.pixelSize: 8
                            Layout.alignment: Qt.AlignHCenter
                        }


                        Text {
                            text: "HIGH"
                            font.pixelSize: 8
                            color: Services.Colors.on_surface
                            Layout.alignment: Qt.AlignHCenter
                        }

                        Text {
                            text: "LOW"
                            font.pixelSize: 8
                            color: Services.Colors.on_surface
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
        }
        Item {
            id: thirdPage

            Text {
                text: "C"
                anchors.centerIn: parent
                font.pixelSize: 24
                color: Services.Colors.on_surface
            }
        }
    }

    // PageIndicator {
    //     id: indicator

    //     count: view.count
    //     currentIndex: view.currentIndex

    //     anchors.bottom: view.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    // }
}

