import QtQuick
import "../"
Flow {
    id: myFlow
    property real realPadding: MyTheme.returnRealPropertyValue(myFlow.padding)
    property real realSpacing: MyTheme.returnRealPropertyValue(myFlow.spacing)
    property real realWidth: MyTheme.returnRealPropertyValue(myFlow.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myFlow.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myFlow.width)
        if(rW!==myFlow.realWidth)
            myFlow.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myFlow.realWidth)
        if(nW!==myFlow.width)
            myFlow.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myFlow.height)
        if(rH!==myFlow.realHeight)
            myFlow.realWidth=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myFlow.realHeight)
        if(nH!==myFlow.height)
            myFlow.height=nH
    }

    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myFlow.realPadding)
        if(nP!==myFlow.padding)
            myFlow.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myFlow.padding)
        if(rP!==myFlow.realPadding)
            myFlow.realPadding=rP
    }

    onRealSpacingChanged: {
        let nS=MyTheme.returnOriginalPropertyValue(myFlow.realSpacing)
        if(nS!==myFlow.spacing)
            myFlow.spacing=nS
    }

    onSpacingChanged: {
        let rS=MyTheme.returnRealPropertyValue(myFlow.spacing)
        if(rS!==myFlow.realSpacing)
            myFlow.realSpacing=rS
    }
}
