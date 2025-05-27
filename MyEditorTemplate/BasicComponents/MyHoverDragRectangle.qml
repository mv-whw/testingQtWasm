import QtQuick

MyRectangle {
    id: hoverDragRect
    property bool hoverEnabled: true
    //property bool dragEnabled: false
    default property alias contItems: hoverDragContent.children
    property alias minimumXmove: hoverDrag.drag.minimumX
    property alias maximumXmove: hoverDrag.drag.maximumX
    property alias minimumYmove: hoverDrag.drag.minimumY
    property alias maximumYmove: hoverDrag.drag.maximumY
    property alias dragTarget: hoverDrag.drag.target
    property int axisMove: 0 //0-x and y; 1-x; 2-y

    Item{
        id: hoverDragContent
        anchors.fill: parent
    }

    MouseArea{
        id: hoverDrag
        anchors.fill: parent
        hoverEnabled: hoverDragRect.hoverEnabled
        property color startedColor:"transparent"
        property bool hov: false
        drag.axis: (hoverDragRect.axisMove===0? Drag.XAndYAxis: (hoverDragRect.axisMove===1? Drag.XAxis:Drag.YAxis))
        onEntered: {
            parent.color=Qt.lighter(startedColor,1.2)
        }
        onExited: {
            parent.color=startedColor
        }

        onPressed: {
            if(pressed)
            {
                parent.color=Qt.darker(startedColor,1.2)
            }else
                parent.color=startedColor
        }

        onClicked: {
            parent.color=Qt.darker(startedColor,1.2)
        }

        onReleased: {
            parent.color=startedColor
        }

    }

    Component.onCompleted: hoverDrag.startedColor=hoverDragRect.color
}
