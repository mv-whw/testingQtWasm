import QtQuick
import "../BasicComponents"
import "../"
MyTab {
    id: myNormalTabVert

    realHeight: MyTheme.tabTheme.normalVerTabTheme.tabHeight
    width: parent.width
    color: myNormalTabVert.isSelected? MyTheme.tabTheme.normalVerTabTheme.selectedBackgroundColor: (myNormalTabVert.isHovered? Qt.lighter(MyTheme.tabTheme.normalVerTabTheme.backgroundColor,1.2): MyTheme.tabTheme.normalVerTabTheme.backgroundColor)

    MyIcon{
        id: norVerTabIcon
        colorization: 1.0
        colorizationColor: myNormalTabVert.isSelected? MyTheme.tabTheme.normalVerTabTheme.selectedIconColor:MyTheme.tabTheme.normalVerTabTheme.iconColor
        source: myNormalTabVert.iconSource
        realHeight: myNormalTabVert.realHeight*MyTheme.tabTheme.normalVerTabTheme.iconTabRatio
        visible: isLoaded
        x: MyTheme.returnOriginalPropertyValue(myNormalTabVert.realLeftRightPadding)
        anchors.verticalCenter: parent.verticalCenter
    }
    MyLabel{
        id: norVerTabTitle
        text: myNormalTabVert.tabTitle
        fontSize: myNormalTabVert.isSelected? MyTheme.tabTheme.normalVerTabTheme.selectedTitleColor:MyTheme.tabTheme.normalVerTabTheme.titleColor
        anchors.verticalCenter: parent.verticalCenter
        x: (norVerTabIcon.visible? norVerTabIcon.x+norVerTabIcon.width+MyTheme.returnOriginalPropertyValue(myNormalTabVert.realItemSpacing):MyTheme.returnOriginalPropertyValue(myNormalTabVert.realLeftRightPadding))
        width: (norTabVerCloseBtn.visible? norTabVerCloseBtn.x-MyTheme.returnOriginalPropertyValue(myNormalTabVert.realItemSpacing):myNormalTabVert.width-MyTheme.returnOriginalPropertyValue(myNormalTabVert.realLeftRightPadding))-norVerTabTitle.x
        enableElideMode: true
        isBold: myNormalTabVert.isSelected
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            if(!myNormalTabVert.isHovered)
                myNormalTabVert.isHovered=true
        }
        onExited: {
            if(myNormalTabVert.isHovered)
                myNormalTabVert.isHovered=false
        }
        onClicked: {
            if(!myNormalTabVert.isSelected)
                myNormalTabVert.isSelected=true
        }
        onPressAndHold: {

        }
    }
    MyCloseButton{
        id: norTabVerCloseBtn
        x: myNormalTabVert.width-norTabVerCloseBtn.width-MyTheme.returnOriginalPropertyValue(myNormalTabVert.realLeftRightPadding)
        anchors.verticalCenter: parent.verticalCenter
        visible: myNormalTabVert.isSelected || myNormalTabVert.isHovered
        onClickedOn: myNormalTabVert.closeTab(myNormalTabVert.tabId)
    }
}
