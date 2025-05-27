import QtQuick
import "../"
Rectangle {
    id: myRectangle


    property real realRadius: 0.0
    property real borderWidth: 1.0
    property color borderColor: "transparent"
    property real realWidth: MyTheme.returnRealPropertyValue(myRectangle.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myRectangle.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myRectangle.width)
        if(rW!==myRectangle.realWidth)
            myRectangle.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myRectangle.realWidth)
        if(nW!==myRectangle.width)
            myRectangle.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myRectangle.height)
        if(rH!==myRectangle.realHeight)
            myRectangle.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myRectangle.realHeight)
        if(nH!==myRectangle.height)
            myRectangle.height=nH
    }
    onBorderColorChanged: {
        myRectangle.border.color=myRectangle.borderColor
    }

    onBorderWidthChanged: {
        myRectangle.border.width=MyTheme.returnOriginalPropertyValue(myRectangle.borderWidth)
    }



    onRadiusChanged: {
        myRectangle.realRadius=MyTheme.returnRealPropertyValue(myRectangle.radius)
    }

    onRealRadiusChanged: {
        myRectangle.radius=MyTheme.returnOriginalPropertyValue(myRectangle.realRadius)
    }

}
