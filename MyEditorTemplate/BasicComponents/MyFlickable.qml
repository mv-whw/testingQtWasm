import QtQuick
import QtQuick.Controls.Basic
import "../"
Flickable {
    id: myFlicable
    width: parent.width
    height: parent.height
    boundsBehavior: MyTheme.isDesktop? MyFlickable.StopAtBounds:MyFlickable.DragAndOvershootBounds
    clip: true
    property bool flickVertical: true
    flickableDirection: myFlicable.flickVertical ? Flickable.VerticalFlick:Flickable.HorizontalFlick

    property real realWidth: MyTheme.returnRealPropertyValue(myFlicable.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myFlicable.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myFlicable.width)
        if(rW!==myFlicable.realWidth)
            myFlicable.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myFlicable.realWidth)
        if(nW!==myFlicable.width)
            myFlicable.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myFlicable.height)
        if(rH!==myFlicable.realHeight)
            myFlicable.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myFlicable.realHeight)
        if(nH!==myFlicable.height)
            myFlicable.height=nH
    }

}
