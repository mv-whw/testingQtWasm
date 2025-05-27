import QtQuick
import QtQuick.Controls.Basic
import "../"
Label {
    id: myLabel
    color: MyTheme.labelTheme.fontColor

    property alias isBold: myLabel.font.bold
    property alias isUnderlined: myLabel.font.underline
    property alias isItalic: myLabel.font.italic
    property real fontSize: MyTheme.labelTheme.defaultFontSize
    property bool enableElideMode: true

    property real realWidth: MyTheme.returnRealPropertyValue(myLabel.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myLabel.height)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myLabel.width)
        if(rW!==myLabel.realWidth)
            myLabel.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myLabel.realWidth)
        if(nW!==myLabel.width)
            myLabel.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myLabel.height)
        if(rH!==myLabel.realHeight)
            myLabel.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myLabel.realHeight)
        if(nH!==myLabel.height)
            myLabel.height=nH
    }

    elide: myLabel.enableElideMode? Label.ElideRight:Label.ElideNone
    wrapMode: !myLabel.enableElideMode? Label.WrapAtWordBoundaryOrAnywhere: Label.NoWrap

    onFontSizeChanged: {
        myLabel.font.pixelSize=MyTheme.useSpValues? MyTheme.calcToSpValue(myLabel.fontSize):myLabel.fontSize*MyTheme.fontScaling
    }
}
