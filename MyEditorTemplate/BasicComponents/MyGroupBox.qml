import QtQuick
import QtQuick.Controls.Basic
import "../"

GroupBox {
    id: myGroupBox
    property real realWidth: MyTheme.returnRealPropertyValue(myGroupBox.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myGroupBox.height)
    property real realPadding: MyTheme.returnRealPropertyValue(myGroupBox.padding)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myGroupBox.realHeight)
        if(nh!==myGroupBox.height)
            myGroupBox.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myGroupBox.height)
        if(rH!==myGroupBox.realHeight)
            myGroupBox.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myGroupBox.realWidth)
        if(nW!==myGroupBox.width)
            myGroupBox.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myGroupBox.width)
        if(rW!==myGroupBox.realWidth)
            myGroupBox.realWidth=rW
    }

    onRealPaddingChanged: {
        let nP=MyTheme.returnOriginalPropertyValue(myGroupBox.realPadding)
        if(nP!==myGroupBox.padding)
            myGroupBox.padding=nP
    }

    onPaddingChanged: {
        let rP=MyTheme.returnRealPropertyValue(myGroupBox.padding)
        if(rP!==myGroupBox.realPadding)
            myGroupBox.realPadding=rP
    }

    background: MyRectangle{
        y: myGroupBox.topPadding - myGroupBox.bottomPadding
        width: parent.width
        height: parent.height - myGroupBox.topPadding + myGroupBox.bottomPadding
        borderColor: MyTheme.groupBoxTheme.backgroundTheme.frameBorderColor
        borderWidth: MyTheme.groupBoxTheme.backgroundTheme.borderWidth
        realRadius: MyTheme.groupBoxTheme.backgroundTheme.radius
    }

    contentItem: MyColumn{
        realSpacing: 10
    }

    label: MyLabel{
        x: MyTheme.returnOriginalPropertyValue(10)
        color: MyTheme.groupBoxTheme.labelTheme.fontColor
        fontSize: MyTheme.groupBoxTheme.labelTheme.defaultFontSize
        text: myGroupBox.title
        enableElideMode: true
        width: myGroupBox.availableWidth-x
        isBold: true
    }
}
