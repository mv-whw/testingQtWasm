import QtQuick
import "../"
Grid {
    id: myGrid

    property real realPadding: MyTheme.returnRealPropertyValue(myGrid.padding)
    property real realSpacing: MyTheme.returnRealPropertyValue(myGrid.spacing)
    property real realWidth: MyTheme.returnRealPropertyValue(myGrid.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myGrid.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myGrid.width)
        if(rW!==myGrid.realWidth)
            myGrid.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myGrid.realWidth)
        if(nW!==myGrid.width)
            myGrid.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myGrid.height)
        if(rH!==myGrid.realHeight)
            myGrid.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myGrid.realHeight)
        if(nH!==myGrid.height)
            myGrid.height=nH
    }

    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myGrid.realPadding)
        if(nP!==myGrid.padding)
            myGrid.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myGrid.padding)
        if(rP!==myGrid.realPadding)
            myGrid.realPadding=rP
    }

    onRealSpacingChanged: {
        let nS=MyTheme.returnOriginalPropertyValue(myGrid.realSpacing)
        if(nS!==myGrid.spacing)
            myGrid.spacing=nS
    }

    onSpacingChanged: {
        let rS=MyTheme.returnRealPropertyValue(myGrid.spacing)
        if(rS!==myGrid.realSpacing)
            myGrid.realSpacing=rS
    }
}
