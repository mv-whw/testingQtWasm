import QtQuick
import "../"

MyRectangle
{
    id: mySwitch
    property alias checked: sliderItem.checked
    realHeight: 40
    realWidth: mySwitch.realHeight*2
    borderWidth: MyTheme.switchTheme.borderWidth
    borderColor: MyTheme.switchTheme.switchBorderColor
    realRadius: 10
    color: mySwitch.checked? MyTheme.switchTheme.switchCheckedColor:MyTheme.switchTheme.switchUnCheckedColor
    opacity: mySwitch.enabled? 1.0:0.3

    onCheckedChanged:{
        if(mySwitchAnimation.running)
            mySwitchAnimation.stop()
        if(checked)
        {
            if(sliderItem.x!==mySwitch.width-mySwitch.border.width-sliderItem.width)
                sliderItem.x=mySwitch.width-mySwitch.border.width-sliderItem.width
        }
        else
        {
            if(sliderItem.x!==mySwitch.border.width)
                sliderItem.x=mySwitch.border.width
        }
    }


    MyHoverDragRectangle{
        id: sliderItem
        property bool checked: false
        //x: sliderItem.checked? mySwitch.width-mySwitch.border.width-sliderItem.width:mySwitch.border.width
        realWidth: parent.realWidth/2-parent.borderWidth
        realHeight: parent.realHeight-2*parent.borderWidth
        anchors.verticalCenter: parent.verticalCenter
        realRadius: parent.realRadius-3
        color: MyTheme.switchTheme.switchSliderColor

        Component.onCompleted: {
            if(sliderItem.checked)
                sliderItem.x=mySwitch.width-mySwitch.border.width-sliderItem.width
            else
                sliderItem.x=mySwitch.border.width
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked: {
            if(!mySwitchAnimation.running)
                mySwitchAnimation.start()
        }
    }


    NumberAnimation {
        id: mySwitchAnimation
        target: sliderItem
        property: "x"
        duration: MyTheme.switchTheme.animationSpeed
        from: sliderItem.x
        to: !mySwitch.checked? mySwitch.width-mySwitch.border.width-sliderItem.width:mySwitch.border.width
        onStopped: {
            if(sliderItem.x===mySwitch.border.width)
                sliderItem.checked=false
            else if(sliderItem.x===mySwitch.width-mySwitch.border.width-sliderItem.width)
                sliderItem.checked=true
        }
    }
}
