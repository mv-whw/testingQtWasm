import QtQuick
import QtQuick.Controls.Basic
import "../"
ApplicationWindow {
    id: appWindow
    visible: true
    property real realWidth: MyTheme.returnRealPropertyValue(appWindow.width)
    property real realHeight: MyTheme.returnRealPropertyValue(appWindow.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(appWindow.width)
        if(rW!==appWindow.realWidth)
            appWindow.realWidth=rW
        MyTheme.appWindowWidth=width
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(appWindow.realWidth)
        if(nW!==appWindow.width)
            appWindow.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(appWindow.height)
        if(rH!==appWindow.realHeight)
            appWindow.realHeight=rH
        MyTheme.appWindowHeight=appWindow.height
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(appWindow.realHeight)
        if(nH!==appWindow.height)
            appWindow.height=nH
    }

    background: MyRectangle{
        color: MyTheme.windowPageTheme.backgroundColor
    }


    function orientationCheck():void
    {
        MyTheme.isLandscapeMode=(appWindow.width>appWindow.height)
    }

    Component.onCompleted: {
        MyTheme.appWindowWidth=appWindow.width
        MyTheme.appWindowHeight=appWindow.height
        MyTheme.platformOS=Qt.platform.os
    }
}
