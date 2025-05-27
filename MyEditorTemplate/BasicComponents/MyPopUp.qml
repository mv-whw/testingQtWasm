import QtQuick
import QtQuick.Controls.Basic
import "../"
Popup {
    id: myPopUp
    property real realWidth: MyTheme.returnRealPropertyValue(myPopUp.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myPopUp.height)

    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myPopUp.realHeight)
        if(nh!==myPopUp.height)
            myPopUp.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myPopUp.height)
        if(rH!==myPopUp.realHeight)
            myPopUp.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myPopUp.realWidth)
        if(nW!==myPopUp.width)
            myPopUp.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myPopUp.width)
        if(rW!==myPopUp.realWidth)
            myPopUp.realWidth=rW
    }

    background: MyRectangle{
        color: MyTheme.popUpTheme.backgroundColor
        realRadius: MyTheme.popUpTheme.radius
        borderColor: MyTheme.popUpTheme.backgroundBorderColor
        borderWidth: MyTheme.popUpTheme.borderWidth
    }
}
