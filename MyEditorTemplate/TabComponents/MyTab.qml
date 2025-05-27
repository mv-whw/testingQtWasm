import QtQuick 2.15
import "../"
import "../BasicComponents"
MyRectangle {
    id: myTab
    property string tabId: "user"+":"+tabTitle //TODO change to unique usedID
    property bool showCloseButton: false
    property bool showBadge: false
    property bool showIcon: true
    property string iconSource: ""
    property string tabTitle: ""
    property string badgeText: ""
    property bool isSelected: false
    property bool isHovered: false
    readonly property real realLeftRightPadding: (realRadius!==0? radius: 10)
    readonly property real realItemSpacing: 5

    signal selected(tabId: string)
    signal closeTab(tabId: string)
    signal tabHovered(tabId: string)

    onIsSelectedChanged: {
        if(myTab.isSelected)
            myTab.selected(myTab.tabId)//TODO change to tabID
    }

    onIsHoveredChanged: {
        if(myTab.isHovered)
            myTab.tabHovered(myTab.tabId)//TODO change to tabID
    }


}
