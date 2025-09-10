import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io

import "root:/data/" as Data
import "root:/Services/" as Services


Item {
    id: btPill

    MarginWrapperManager {
        margin: 0
        resizeChild: true
    }

    WrapperRectangle {
        color: "white"
        radius: 6    
        id: btPillBg

        margin: 0
        resizeChild: true

        RowLayout {
            spacing: 0
            HoverHandler {
                id: btPillHover
                onHoveredChanged: {
                    btNumConn.visible = btPillHover.hovered;
                }
            }

            Text {
                id: btNumConn
                text: ` ${Data.Network.bt_conn}` // Bluetooth device name
                color: "black"
                visible: false
            }
            
            WrapperRectangle {
                color: {
                     
                    if (Data.Network.bt_conn > 0 ) {
                        return Services.Colors.primary
                    }
                    else if (Data.Network.bt_status == 0) {
                        return "transparent"
                    }
                    else if (Data.Network.bt_status == 1) {
                        return Services.Colors.primary
                    }
                    else if (Data.Network.bt_status == 2) {
                        return "green"
                    }

                    print("Unknown Bluetooth status:", Data.Network.bt_status);

                    return "pink"
                }
                id: btPillIcon
                radius: 20

                resizeChild: true
                margin: 2

                Text {
                    text: "󰂯" // Bluetooth icon
                    color: {
                        if (Data.Network.bt_conn > 0) {
                            return "black"
                        } else {
                            return "black"
                        }
                    }
                   
                    Layout.fillHeight: true
                    horizontalAlignment: Text.AlignHCenter
                }
            }
        }
    }
}