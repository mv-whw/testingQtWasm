import QtQuick
import "../"
Row {
    id: myRow
    property real realPadding: MyTheme.returnRealPropertyValue(myRow.padding)
    property real realSpacing: MyTheme.returnRealPropertyValue(myRow.spacing)
    property real realWidth: MyTheme.returnRealPropertyValue(myRow.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myRow.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myRow.width)
        if(rW!==myRow.realWidth)
            myRow.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myRow.realWidth)
        if(nW!==myRow.width)
            myRow.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myRow.height)
        if(rH!==myRow.realHeight)
            myRow.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myRow.realHeight)
        if(nH!==myRow.height)
            myRow.height=nH
    }
    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myRow.realPadding)
        if(nP!==myRow.padding)
            myRow.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myRow.padding)
        if(rP!==myRow.realPadding)
            myRow.realPadding=rP
    }

    onRealSpacingChanged: {
        let nS=MyTheme.returnOriginalPropertyValue(myRow.realSpacing)
        if(nS!==myRow.spacing)
            myRow.spacing=nS
    }

    onSpacingChanged: {
        let rS=MyTheme.returnRealPropertyValue(myRow.spacing)
        if(rS!==myRow.realSpacing)
            myRow.realSpacing=rS
    }
}
