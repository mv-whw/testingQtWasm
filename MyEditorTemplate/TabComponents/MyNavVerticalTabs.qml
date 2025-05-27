import QtQuick
import "../BasicComponents"
import "../"

MyTab {
    id: myNavVerTabs
    color: (myNavVerTabs.isSelected? MyTheme.tabTheme.navTabsTheme.selectedBackgroundColor: (myNavVerTabs.isHovered? Qt.lighter(MyTheme.tabTheme.navTabsTheme.backgroundColor,1.2): MyTheme.tabTheme.navTabsTheme.backgroundColor))
    realHeight: MyTheme.tabTheme.navTabsTheme.tabHeight
    MyIcon{
        useSourceSize: false
        visible: isLoaded
        source: myNavVerTabs.iconSource
        anchors.horizontalCenter: parent.horizontalCenter
        realHeight: MyTheme.tabTheme.navTabsTheme.tabHeight*0.8
        y: MyTheme.returnOriginalPropertyValue(5)
    }

    MyLabel{
        text: myNavVerTabs.tabTitle
        color: MyTheme.tabTheme.navTabsTheme.titleColor
        fontSize: MyTheme.tabTheme.navTabsTheme.fontSize
        anchors.horizontalCenter: parent.horizontalCenter
        y: myNavVerTabs.height-height-MyTheme.returnOriginalPropertyValue(5)
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            if(!myNavVerTabs.isHovered)
                myNavVerTabs.isHovered=true
        }
        onExited: {
            if(myNavVerTabs.isHovered)
                myNavVerTabs.isHovered=false
        }
        onClicked: {
            if(!myNavVerTabs.isSelected)
                myNavVerTabs.isSelected=true
        }
    }
}
