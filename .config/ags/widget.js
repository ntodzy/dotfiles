const battery = await Service.import('battery');

const batteryProgress = Widget.CircularProgress({
    child: Widget.Label({
        label: '{value}',
    }),
    visible: battery.bind('available'),
    value: battery.bind('percent').as(p => p > 0 ? p / 100 : 0),
    class_name: battery.bind('charging').as(ch => ch ? 'charging' : ''),
})

function SideBar(monitor=0) {
    const myLabel = Widget.Label({
        label: 'some example content',
    })



    return Widget.Window({
        monitor,
        name: `bar${monitor}`, // unique
        anchor: ['left'],
        child:  batteryProgress,
    })
}

export { SideBar, batteryProgress };