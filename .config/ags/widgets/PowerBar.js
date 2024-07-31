let PowerBtn = () => {
    return Widget.Button({
        class_name: "btn",
        label: "⏻",
        on_clicked: () => { print("Shutdown") },
        css: "background-color: @bg-power;"
    })
}

let LogoutBtn = () => { 
    return Widget.Button({
        css: "background-color: pink;",
        class_name: "btn",
        label: "󱄋",
        on_clicked: () => { print("Logout") },
    })
}

let ReloadBtn = () => {
    return Widget.Button({
        class_name: "btn",
        label: "󰗽",
        on_clicked: () => { print("Reboot")}
    })
}

let power_control = Widget.CenterBox({
        center_widget: Widget.Box([
            PowerBtn(),
            LogoutBtn(),
            ReloadBtn(),
        ]),

})

export {power_control}