const audio = await Service.import("audio")


function AudioBar() {
    const slider = Widget.Slider({
        min: 0,
        max: 150,
        value: 50,
        step: 1,
        on_change: ({value}) => {
            audio.speaker.volume = value / 100;
            value = audio.speaker.volume;
        },

        setup: self => self.hook(audio.speaker, () => {
            self.value = audio.speaker.volume * 100;
        }),

        draw_value: false,

        class_name: "volume-slider",
    });

    const icon = Widget.Button({
        on_clicked: () => { audio.speaker.is_muted = !audio.speaker.is_muted },
        class_name: "btn bd-none",
        child: Widget.Label({class_name: "bg-transparent"}).hook(audio.speaker, self => {
            let strv = String(audio.speaker.volume * 100)
            self.label = audio.speaker.volume > 0 ? strv.slice(0, strv.indexOf(".")).concat("%") : "  🔇  ";
            self.label = audio.speaker.is_muted ? "  🔇  " : self.label;
        }),
        css: "background-color: transparent; color: white; font-size: 9px;"
    });

    const dropdown_btn = Widget.Button({
        label: "🔊",
        class_name: "btn bd-none",
        on_clicked: self => { 
            dropdown.visible ? dropdown.hide() : dropdown.show(); 
            dropdown_2.visible ? dropdown_2.hide() : dropdown_2.show();

            print(audio.speakers.map((stream) => {
                stream.description
            }).length);
         },
    });


    const SinkItem = (stream) => Widget.Button({
        hexpand: true,
        on_clicked: () => { audio.speaker = stream;   },
        class_name: "btn",
        child: Widget.Box({
            children: [
                Widget.Label({
                    class_name: "bg-transparent",
                }),
                Widget.Label({
                    label: (stream.description || "").split(" ").slice(2, 4).join(" "),
                    class_name: "bg-transparent",
                }),
            ],
            spacing: 5,
        }),
    });


    const dropdown = Widget.Box({
        vertical: true,
        spacing: 5,
        visible: true,
        children: [
            Widget.Label({label: "Speakers", class_name: "bg-transparent"}),
            Widget.Box({
                vertical: true,
                children: audio.bind("speakers").as( a => a.map(SinkItem)),
            }),
        ],
        class_name: "dropdown",
    });


    const dropdown_2 = Widget.Box({
        vertical: true,
        spacing: 5,
        visible: true,
        children: [
            Widget.Label({label: "Microphones", class_name: "bg-transparent"}),
            Widget.Box({
                vertical: true,
                children: audio.bind("microphones").as( a => a.map(SinkItem)),
            }),
        ],
        class_name: "dropdown",
    });

    const mic_mute_btn =
        Widget.Button({
            class_name: "btn",
            on_clicked: () => { audio.microphone.is_muted = !audio.microphone.is_muted; print(audio.microphone.is_muted) },
            css: "background-color: transparent; color: white; font-size: 9px;"
        });

    mic_mute_btn.hook(audio.microphone, self => {
        self.label = audio.microphone.is_muted ? "🔇" : "🎤";
    });

    let obj = Widget.Box({
        children: [
            Widget.Box({
                children: [ slider, icon, dropdown_btn, mic_mute_btn],
                class_name: "bar",
            }),

            dropdown,

            dropdown_2
        ],
        vertical: true,
        spacing: 10,
    });

    return obj;
}

export { AudioBar }