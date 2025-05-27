import QtQuick

MyRectangle {
    id: simB
    property alias text: myla.text
    property alias isBold: myla.isBold
    signal clicked()
    radius: width
    MyLabel{
        id: myla
        anchors.centerIn: parent
        fontSize: 17

    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: myla.isBold=true
        onExited: myla.isBold=false
        onClicked: simB.clicked()
    }
}
