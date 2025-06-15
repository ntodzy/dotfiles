import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import QtQuick.Effects

import "./DashItem.qml"
import "./DashBtn.qml"
import "root:/windows/Dashboard/widgets" as Widgets
import "root:/Services" as Services
import "root:/Data/" as Data

import "root:/windows/Dashboard/Screens/Dashboard/" as Dashboard

Scope {
    id: root
    Variants {
        model: Quickshell.screens 
        delegate: PanelWindow {
            id: sidePanel
            required property ShellScreen modelData

            anchors {
                left: true
                top: true
                bottom: true
            }

            // exclusionMode: ExclusionMode.Ignore // switch this to make it go over the screen area
            color: "transparent"
            implicitWidth: 288

            screen: modelData

            Dashboard.Dashboard {}
        }
    }
}
