import QtQuick
import "../BasicComponents"
import "../"
MyRectangle{
    property bool isBackButton: true

    signal clickedOn(isBack: bool)

    color: myKolNavMA.isHovered? Qt.lighter(MyTheme.buttonTheme.backgroundColor,1.2):MyTheme.buttonTheme.backgroundColor
    bottomRightRadius : isBackButton? 0:MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius)
    topRightRadius: isBackButton? 0:MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius)
    bottomLeftRadius: isBackButton? MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius):0
    topLeftRadius: isBackButton? MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius):0

    realHeight: 40
    realWidth: 60

    MyLabel{
        anchors.centerIn: parent
        fontSize: 16
        isBold: true
        color: "white"
        text: parent.isBackButton? "<<":">>"
    }

    MouseArea{
        id: myKolNavMA
        property bool isHovered: false
        anchors.fill: parent
        hoverEnabled: true
        onEntered: isHovered=true
        onExited: isHovered=false
        onClicked: parent.clickedOn(parent.isBackButton)
    }
}
