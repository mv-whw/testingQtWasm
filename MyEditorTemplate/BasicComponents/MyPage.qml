import QtQuick
import QtQuick.Controls.Basic
import "../"

Page {
    id: myPage
    property real realWidth: MyTheme.returnRealPropertyValue(myPage.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myPage.height)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myPage.realHeight)
        if(nh!==myPage.height)
            myPage.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myPage.height)
        if(rH!==myPage.realHeight)
            myPage.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myPage.realWidth)
        if(nW!==myPage.width)
            myPage.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myPage.width)
        if(rW!==myPage.realWidth)
            myPage.realWidth=rW
    }


    background: MyRectangle{
        color: MyTheme.windowPageTheme.backgroundColor
    }
}
