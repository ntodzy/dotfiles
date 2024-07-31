const hyprland = await Service.import("hyprland")

const battery = await Service.import("battery")

import { power_control } from "./widgets/PowerBar.js"
import { AudioBar } from "./widgets/AudioBar.js"

function ControlPanel(monitor=0) {
    return Widget.Window({
        name: "control-panel",
        class_name: "control-panel",
        monitor, 
        anchor: ["top", "right"],
        child: Widget.CenterBox({
            center_widget: Widget.Box({
                children: [ AudioBar(), power_control ],
                class_name: "container",
                css: "min-width: 360px;",
                vertical: true,
                spacing: 5,
            }),
        })
    });
}



App.config({
    style: "./style.css",
    windows: [
        // Bar(),
        ControlPanel(),
    ],
})

export { }
