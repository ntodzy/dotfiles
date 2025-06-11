import "DashItem.qml"
import QtQuick.Effects


DashItem {
    id: root
    scale: 3
    required property string color
    property int radius: 24


    rect.color: color
    rect.radius: radius
    


}