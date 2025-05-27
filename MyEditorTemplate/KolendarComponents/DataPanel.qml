import QtQuick
import "../BasicComponents"
import "../"
MyRectangle{
    id: myKolDataPanel
    property bool isMonthData: true
    property int value: 1
    color: "white"
    realHeight: 40
    borderColor: "black"
    borderWidth: 1.4
    MyRow{
        anchors.centerIn: parent
        realSpacing: 10
        MyLabel{
            text:myKolDataPanel.isMonthData? qsTr("Mesec:"):qsTr("Leto:")
            fontSize: 14
            color: "black"
        }
        MyLabel{
            text: myKolDataPanel.value
            isBold: true
            fontSize: 14
            color: "black"
        }
    }
}
