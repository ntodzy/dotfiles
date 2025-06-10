import "DashItem.qml"

DashItem {
    scale: 3
    required property string color
    property int radius: 6

    rect.color: color
    rect.radius: radius
}