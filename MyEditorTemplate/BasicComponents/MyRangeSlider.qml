import QtQuick
import QtQuick.Controls.Basic
import "../"
RangeSlider {
    id: myRangeSlider
    hoverEnabled: true
    snapMode: RangeSlider.SnapAlways
    property real realWidth: MyTheme.returnRealPropertyValue(myRangeSlider.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myRangeSlider.height)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myRangeSlider.realHeight)
        if(nh!==myRangeSlider.height)
            myRangeSlider.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myRangeSlider.height)
        if(rH!==myRangeSlider.realHeight)
            myRangeSlider.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myRangeSlider.realWidth)
        if(nW!==myRangeSlider.width)
            myRangeSlider.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myRangeSlider.width)
        if(rW!==myRangeSlider.realWidth)
            myRangeSlider.realWidth=rW
    }

    background: MyRectangle {
        x: myRangeSlider.leftPadding
        y: myRangeSlider.topPadding + myRangeSlider.availableHeight / 2 - height / 2
        width: myRangeSlider.availableWidth
        realHeight: MyTheme.sliderTheme.sliderLineHeight
        radius: height/2
        color: MyTheme.sliderTheme.sliderLineColor

        Rectangle {
            x: myRangeSlider.first.visualPosition * parent.width
            width: myRangeSlider.second.visualPosition * parent.width - x
            height: parent.height
            color: MyTheme.sliderTheme.sliderValueLineColor
            radius: parent.radius
        }
    }

    first.handle: Rectangle {
        x: myRangeSlider.leftPadding + myRangeSlider.first.visualPosition * (myRangeSlider.availableWidth - width)
        y: myRangeSlider.topPadding + myRangeSlider.availableHeight / 2 - height / 2
        implicitWidth: MyTheme.sliderTheme.handleWidth
        implicitHeight: MyTheme.sliderTheme.handleHeight
        radius: implicitWidth/2
        color: myRangeSlider.first.pressed ? Qt.darker(MyTheme.sliderTheme.sliderHandleColor,1.2): (myRangeSlider.first.hovered? Qt.lighter(MyTheme.sliderTheme.sliderHandleColor,1.2) : MyTheme.sliderTheme.sliderHandleColor)
    }

    second.handle: Rectangle {
        x: myRangeSlider.leftPadding + myRangeSlider.second.visualPosition * (myRangeSlider.availableWidth - width)
        y: myRangeSlider.topPadding + myRangeSlider.availableHeight / 2 - height / 2
        implicitWidth: MyTheme.sliderTheme.handleWidth
        implicitHeight: MyTheme.sliderTheme.handleHeight
        radius: implicitWidth/2
        color: myRangeSlider.second.pressed ? Qt.darker(MyTheme.sliderTheme.sliderHandleColor,1.2): (myRangeSlider.second.hovered? Qt.lighter(MyTheme.sliderTheme.sliderHandleColor,1.2) : MyTheme.sliderTheme.sliderHandleColor)
    }
}
