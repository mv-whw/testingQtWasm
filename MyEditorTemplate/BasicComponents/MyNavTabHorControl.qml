import QtQuick
import "../"
import "../TabComponents"
MyTabControl{
    id: myNavTabControl
    realHeight: MyTheme.tabTheme.navTabsTheme.tabHeight
    property bool useBorder: false
    property Component tabComponent: MyNavHorizontalTabs{}
    MyRow{
        id: myNavTabRow
        realWidth: parent.realWidth
        realHeight: parent.realHeight
        realSpacing: 0

        function resizeTabs(): bool
        {
            let n=myNavTabRow.children.lenght
            if(n>0)
            {
                let nW= myNavTabRow.realWidth/n
                for(let i=0; i<n; i++)
                    myNavTabRow.children[i].realWidth=nW
            }
        }
    }

    function createTab(title: string, iconSourcee: string,ins:string): bool
    {
        let obj=tabComponent.createObject(myNavTabRow,{"tabTitle": title, "iconSource":iconSourcee, "showBorder":myNavTabControl.useBorder})
        if(obj!==null)
        {
            myNavTabControl.tabCreated(ins)
            return true
        }
        else
            return false
    }
}
