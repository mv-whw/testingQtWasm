import QtQuick
import "../BasicComponents"
import "../"
MyTab {
    id: myRotatedTabs
    property bool isTabOnLeft: true
    color: (myRotatedTabs.isSelected? MyTheme.tabTheme.rotatedTabTheme.selectedBackgroundColor: (myRotatedTabs.isHovered? Qt.lighter(MyTheme.tabTheme.rotatedTabTheme.backgroundColor,1.2):MyTheme.tabTheme.rotatedTabTheme.backgroundColor))
    realHeight: MyTheme.tabTheme.rotatedTabTheme.defaultTabHeight
    realWidth: MyTheme.tabTheme.rotatedTabTheme.defaultTabWidth

    bottomLeftRadius: isTabOnLeft? 0:MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius)
    topLeftRadius: isTabOnLeft? 0:MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius)
    bottomRightRadius: isTabOnLeft? MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius):0
    topRightRadius: isTabOnLeft? MyTheme.returnOriginalPropertyValue(MyTheme.tabTheme.rotatedTabTheme.tabRadius):0

    MyLabel{
        text: myRotatedTabs.tabTitle
        color: myRotatedTabs.isSelected? MyTheme.tabTheme.rotatedTabTheme.selectedTitleColor:MyTheme.tabTheme.rotatedTabTheme.titleColor
        isBold: true
        rotation: myRotatedTabs.isTabOnLeft? 90:270
        anchors.centerIn: parent
    }

    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            if(!myRotatedTabs.isHovered)
                myRotatedTabs.isHovered=true
        }
        onExited: {
            if(myRotatedTabs.isHovered)
                myRotatedTabs.isHovered=false
        }
        onClicked: {
            if(!myRotatedTabs.isSelected)
                myRotatedTabs.isSelected=true
        }
    }
}
