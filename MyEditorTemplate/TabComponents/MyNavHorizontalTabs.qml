import QtQuick
import "../BasicComponents"
import "../"
MyTab
{
    id: myNavTab

    color: myNavTab.isSelected? MyTheme.tabTheme.navTabsTheme.selectedBackgroundColor: myNavTab.isHovered? Qt.lighter(MyTheme.tabTheme.navTabsTheme.backgroundColor,1.2):MyTheme.tabTheme.navTabsTheme.backgroundColor

    MyIcon{
        id: myNavHorTabIcon
        visible: isLoaded
        colorization: 1.0
        colorizationColor: myNavTab.isSelected? MyTheme.tabTheme.navTabsTheme.selectedIconColor: myNavTab.isHovered? Qt.lighter( MyTheme.tabTheme.navTabsTheme.iconColor,1.2):MyTheme.tabTheme.navTabsTheme.iconColor
        realHeight: myNavTab.realHeight/10*7
        anchors.horizontalCenter: parent.horizontalCenter
        y: myNavHorTabText.visible? MyTheme.returnOriginalPropertyValue(5):myNavTab.height/2-myNavHorTabIcon.height/2
    }

    MyLabel{
        id: myNavHorTabText
        text: myNavTab.tabTitle
        fontSize: MyTheme.tabTheme.navTabsTheme.fontSize
        anchors.horizontalCenter: parent.horizontalCenter
        color: myNavTab.isSelected? MyTheme.tabTheme.navTabsTheme.selectedTitleColor: myNavTab.isHovered? Qt.lighter(MyTheme.tabTheme.navTabsTheme.titleColor,1.2):MyTheme.tabTheme.navTabsTheme.titleColor
        y: myNavTab.height-MyTheme.returnOriginalPropertyValue(5)-myNavHorTabText.height
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if(!myNavTab.isSelected)
                myNavTab.isSelected=true
        }

        onEntered: {
            if(!myNavTab.isHovered)
                myNavTab.isHovered=true
        }

        onExited: {
            if(myNavTab.isHovered)
                myNavTab.isHovered=false
        }
    }
}
