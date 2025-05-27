import QtQuick
import "../BasicComponents"
import "../"
MyTab
{
    id: myNormalTabHorizontal
    realHeight: MyTheme.tabTheme.normalHorTabTheme.tabHeight
    realWidth: MyTheme.tabTheme.normalHorTabTheme.defaultTabWidth
    color: myNormalTabHorizontal.isSelected? MyTheme.tabTheme.normalHorTabTheme.selectedBackgroundColor: (myNormalTabHorizontal.isHovered? Qt.lighter(MyTheme.tabTheme.normalHorTabTheme.backgroundColor,1.2):MyTheme.tabTheme.normalHorTabTheme.backgroundColor)

    MyIcon{
        id: norHorTabIcon
        x: MyTheme.returnOriginalPropertyValue(myNormalTabHorizontal.realLeftRightPadding)
        source: myNormalTabHorizontal.iconSource
        colorization: 1.0
        colorizationColor: myNormalTabHorizontal.isSelected? MyTheme.tabTheme.normalHorTabTheme.selectedIconColor:MyTheme.tabTheme.normalHorTabTheme.iconColor
        visible: (isLoaded && myNormalTabHorizontal.showIcon)
        realHeight: parent.realHeight*MyTheme.tabTheme.normalHorTabTheme.iconTabRatio
        anchors.verticalCenter: parent.verticalCenter

    }

    MyLabel{
        id: norHorTabTitle
        x: norHorTabIcon.visible? (norHorTabIcon.x+norHorTabIcon.width+MyTheme.returnOriginalPropertyValue(myNormalTabHorizontal.realItemSpacing)):norHorTabIcon.x
        text: myNormalTabHorizontal.tabTitle
        fontSize: MyTheme.tabTheme.normalHorTabTheme.fontSize
        color: myNormalTabHorizontal.isSelected? MyTheme.tabTheme.normalHorTabTheme.selectedTitleColor:MyTheme.tabTheme.normalHorTabTheme.titleColor
        enableElideMode: true
        isBold: myNormalTabHorizontal.isSelected
        width: myNormalTabHorizontal.width-(norHorTabCloseBtn.visible? norHorTabCloseBtn.x-MyTheme.returnOriginalPropertyValue(myNormalTabHorizontal.realItemSpacing):MyTheme.returnOriginalPropertyValue(myNormalTabHorizontal.realLeftRightPadding))-norHorTabTitle.x
        anchors.verticalCenter: parent.verticalCenter
    }

    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            myNormalTabHorizontal.isHovered=true
        }
        onExited: {
            myNormalTabHorizontal.isHovered=false
        }
        onClicked: {
            if(!myNormalTabHorizontal.isSelected)
                myNormalTabHorizontal.isSelected=true
        }
        onPressAndHold: {

        }
    }

    MyCloseButton{
        id: norHorTabCloseBtn
        x: myNormalTabHorizontal.width-norHorTabCloseBtn.width-MyTheme.returnOriginalPropertyValue(myNormalTabHorizontal.realLeftRightPadding)
        visible: myNormalTabHorizontal.isSelected || myNormalTabHorizontal.isHovered
        anchors.verticalCenter: parent.verticalCenter
        onClickedOn: myNormalTabHorizontal.closeTab(myNormalTabHorizontal.tabId)
    }

}
