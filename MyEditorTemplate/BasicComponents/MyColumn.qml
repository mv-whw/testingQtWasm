import QtQuick
import "../"
Column {
    id: myColumn

    property real realPadding: MyTheme.returnRealPropertyValue(myColumn.padding)
    property real realSpacing: MyTheme.returnRealPropertyValue(myColumn.spacing)
    property real realWidth: MyTheme.returnRealPropertyValue(myColumn.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myColumn.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myColumn.width)
        if(rW!==myColumn.realWidth)
            myColumn.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myColumn.realWidth)
        if(nW!==myColumn.width)
            myColumn.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myColumn.height)
        if(rH!==myColumn.realHeight)
            myColumn.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myColumn.realHeight)
        if(nH!==myColumn.height)
            myColumn.height=nH
    }

    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myColumn.realPadding)
        if(nP!==myColumn.padding)
            myColumn.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myColumn.padding)
        if(rP!==myColumn.realPadding)
            myColumn.realPadding=rP
    }

    onRealSpacingChanged: {
        let nS=MyTheme.returnOriginalPropertyValue(myColumn.realSpacing)
        if(nS!==myColumn.spacing)
            myColumn.spacing=nS
    }

    onSpacingChanged: {
        let rS=MyTheme.returnRealPropertyValue(myColumn.spacing)
        if(rS!==myColumn.realSpacing)
            myColumn.realSpacing=rS
    }
}
