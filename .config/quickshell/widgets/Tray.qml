import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick.Layouts
import QtQuick

import "root:/widgets/" as Widgets

Item {
    id: trayWidget

    readonly property Repeater items: items

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
                id: items
                model: SystemTray.items

                Widgets.TrayItem {}
            }
        }
    }

}