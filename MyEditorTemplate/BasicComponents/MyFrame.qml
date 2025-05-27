import QtQuick
import QtQuick.Controls.Basic
import "../"

Frame {
    id: myFrame

    property real realWidth: MyTheme.returnRealPropertyValue(myFrame.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myFrame.height)
    property real realPadding: MyTheme.returnRealPropertyValue(myFrame.padding)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myFrame.realHeight)
        if(nh!==myFrame.height)
            myFrame.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myFrame.height)
        if(rH!==myFrame.realHeight)
            myFrame.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myFrame.realWidth)
        if(nW!==myFrame.width)
            myFrame.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myFrame.width)
        if(rW!==myFrame.realWidth)
            myFrame.realWidth=rW
    }

    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myFrame.realPadding)
        if(nP!==myFrame.padding)
            myFrame.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myFrame.padding)
        if(rP!==myFrame.realPadding)
            myFrame.realPadding=rP
    }

    background: MyRectangle{
        color: MyTheme.frameTheme.backgroundColor
        borderColor: MyTheme.frameTheme.frameBorderColor
        borderWidth: MyTheme.frameTheme.borderWidth
        realRadius: MyTheme.frameTheme.radius
    }

    contentItem: MyColumn{
        realSpacing: MyTheme.frameTheme.itemsSpacing
    }
}
