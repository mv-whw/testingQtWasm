import QtQuick
import QtQuick.Controls.Basic
import "../"
Slider {
    id: mySlider
    snapMode:Slider.SnapAlways

    hoverEnabled: true
    property real realWidth: MyTheme.returnRealPropertyValue(mySlider.width)
    property real realHeight: MyTheme.returnRealPropertyValue(mySlider.height)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(mySlider.realHeight)
        if(nh!==mySlider.height)
            mySlider.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(mySlider.height)
        if(rH!==mySlider.realHeight)
            mySlider.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(mySlider.realWidth)
        if(nW!==mySlider.width)
            mySlider.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(mySlider.width)
        if(rW!==mySlider.realWidth)
            mySlider.realWidth=rW
    }

    background: MyRectangle {
        x: mySlider.leftPadding
        y: mySlider.topPadding + mySlider.availableHeight / 2 - height / 2
        width: mySlider.availableWidth
        realHeight: MyTheme.sliderTheme.sliderLineHeight
        radius: height/2
        color: MyTheme.sliderTheme.sliderLineColor

        Rectangle {
            width: mySlider.visualPosition * parent.width
            height: parent.height
            color: MyTheme.sliderTheme.sliderValueLineColor
            radius: parent.radius
        }
    }

    handle: Rectangle {
        x: mySlider.leftPadding + mySlider.visualPosition * (mySlider.availableWidth - width)
        y: mySlider.topPadding + mySlider.availableHeight / 2 - height / 2
        implicitWidth: MyTheme.sliderTheme.handleWidth
        implicitHeight: MyTheme.sliderTheme.handleHeight
        radius: implicitWidth/2
        color: mySlider.pressed ? Qt.darker(MyTheme.sliderTheme.sliderHandleColor,1.2) : (mySlider.hovered? Qt.lighter(MyTheme.sliderTheme.sliderHandleColor,1.2):MyTheme.sliderTheme.sliderHandleColor)
    }
}
