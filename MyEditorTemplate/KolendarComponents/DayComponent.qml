import QtQuick
import "../BasicComponents"
import "../"
MyRectangle {
    property bool isSelected: false
    property bool isCurrentDay: false
    property bool canBeSelected: true
    property alias dayValue: myDay.text

    borderColor: "black"
    borderWidth: isSelected? 1.6:0.0

    MyLabel{
        id: myDay
        anchors.centerIn: parent
        color: parent.canBeSelected? "black":"lightgrey"
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {

        }
        onExited: {

        }
        onClicked: {
            if(parent.canBeSelected && !parent.isSelected)
                parent.isSelected=true
        }
    }
}
