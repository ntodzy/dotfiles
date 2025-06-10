//@ pragma UseQApplication
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import Quickshell.Services.SystemTray

import "root:/widgets/" as Widgets
import "root:/windows/" as Windows
import "root:/windows/Dashboard/" as Dashboard

Scope {
    id: root

    Windows.Bar {}
    Dashboard.Dashboard {}
}

