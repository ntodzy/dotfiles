import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick.Layouts
import QtQuick





Item {
    id: trayWidget

    function iconInterface(app) {
        let iconLocation = "/.config/icons/";
        if (app == "spotify-client") {
            return `root:/icons/${app}.png`;
        }
    }

    height: 24

    MarginWrapperManager {
        margin: 0
        resizeChild: true
    }

    WrapperRectangle {
        color: "transparent"
        radius: 6

        id: trayBackground

        margin: 2
        resizeChild: true

        RowLayout {
            spacing: 0

            Repeater {
                model: SystemTray.items.values.length

                Item {
                    required property int index

                    MarginWrapperManager {
                        margin: 0
                        resizeChild: true
                    }

                    IconImage {
                        implicitSize: 20
                        source: `${iconInterface(SystemTray.items.values[index].id)}`
                        Layout.fillHeight: true
                        Layout.preferredWidth: 16
                    }

                    QsMenuAnchor {
                        id: trayMenuAnchor
                        menu: SystemTray.items.values[index].menu
                        anchor.window: bar
                    }

                    HoverHandler {
                        onHoveredChanged: {
                            if (hovered) {
                               trayMenuAnchor.open();
                            } else {
                                trayMenuAnchor.close();
                            }
                        }
                    }
                }

            }
        }
    }

}