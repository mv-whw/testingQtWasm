import QtQuick
import "../"
import "../BasicComponents"
MyRectangle {
    property real itemSize: parent.height*0.8
    realWidth: itemSize
    realHeight: itemSize
    realRadius: itemSize
    color: MyTheme.tabTheme.closeButtonTheme.notHoveredRectColor
    signal clickedOn()
    MyLabel{
        id: myl
        text: "X"
        color: MyTheme.tabTheme.closeButtonTheme.textColor
        fontSize: MyTheme.tabTheme.closeButtonTheme.fontSize
        anchors.centerIn: parent
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            myl.isBold=true
            parent.color=Qt.darker(MyTheme.tabTheme.closeButtonTheme.notHoveredRectColor,1.2)
        }
        onExited: {
            myl.isBold=false
            parent.color=MyTheme.tabTheme.closeButtonTheme.notHoveredRectColor
        }
        onClicked: parent.clickedOn()
    }
}
