import QtQuick 2.15
import "../"
import "../BasicComponents"

MyRectangle {
    id: myTabControl
    color: "transparent"
    property int selectedIndex: -1
    property bool showCloseButton: false
    property bool enableBadge: false

    signal removeTab()
    signal tabCreated(instruction: string)
}
