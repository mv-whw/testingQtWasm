import QtQuick
import QtQuick.Controls.Basic
import "../"
Button {
    id: myButton
    flat: MyTheme.isIos
    property real realWidth: MyTheme.returnRealPropertyValue(myButton.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myButton.height)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myButton.realHeight)
        if(nh!==myButton.height)
            myButton.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myButton.height)
        if(rH!==myButton.realHeight)
            myButton.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myButton.realWidth)
        if(nW!==myButton.width)
            myButton.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myButton.width)
        if(rW!==myButton.realWidth)
            myButton.realWidth=rW
    }

    background: MyRectangle{
        implicitWidth: MyTheme.returnOriginalPropertyValue(80)
        implicitHeight: MyTheme.returnOriginalPropertyValue(40)
        opacity: myButton.enabled? 1.0:0.3
        borderWidth: MyTheme.buttonTheme.borderWidth
        borderColor: MyTheme.buttonTheme.borderColor
        realRadius: MyTheme.buttonTheme.buttonRadius
        color: (myButton.down? Qt.lighter(MyTheme.buttonTheme.backgroundColor,1.2):(myButton.hovered? Qt.darker(MyTheme.buttonTheme.backgroundColor,1.2):MyTheme.buttonTheme.backgroundColor))
        visible: !myButton.flat
    }

    contentItem: MyLabel{
        text: myButton.text
        fontSize: MyTheme.buttonTheme.fontSize
        opacity: myButton.enabled? 1.0:0.3
        color: (myButton.flat? ((myButton.down? Qt.lighter(MyTheme.buttonTheme.backgroundColor,1.2):(myButton.hovered? Qt.darker(MyTheme.buttonTheme.backgroundColor,1.2):MyTheme.buttonTheme.backgroundColor))) :MyTheme.buttonTheme.fontColor)
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        isBold: true
        font.capitalization: MyTheme.isAndroid? Font.AllUppercase: Font.MixedCase
    }

    hoverEnabled: true
}
