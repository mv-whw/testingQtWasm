import QtQuick
import "../TabComponents"
import "../"

MyTabControl{
    id: myNHorTabControl
    color: "transparent"
    width: parent.width
    realHeight: MyTheme.tabTheme.normalHorTabTheme.tabHeight
    showCloseButton: true
    property Component tabComponent: MyNormalTabHorizontal{}


    MyFlickable{
        realWidth: parent.realWidth
        realHeight: MyTheme.tabTheme.normalHorTabTheme.tabHeight
        flickVertical: false
        contentWidth: myNHorTabContRow.width

        MyRow{
            id: myNHorTabContRow
            realHeight: MyTheme.tabTheme.normalHorTabTheme.tabHeight
        }
    }

    function createTab(title: string, tabInstruct: string): bool
    {
        let res=tabComponent.createObject(myNHorTabContRow,{"tabTitle": title})
        if(res!==null)
        {
            myNHorTabControl.tabCreated(tabInstruct)

            return true
        }
        else
            return false
    }

    function deleteCurrentTab()
    {
        if(myNHorTabControl.selectedIndex!==-1)
        {
            let newIndex=(myNHorTabContRow.children.length>1 && myNHorTabControl.selectedIndex===0)? 0:myNHorTabControl.selectedIndex-1
            myNHorTabControl.removeTab()
            myNHorTabContRow.children[myNHorTabControl.selectedIndex].destroy()

        }
    }
}
