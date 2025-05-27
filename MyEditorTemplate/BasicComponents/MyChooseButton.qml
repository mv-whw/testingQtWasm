import QtQuick
import "../"

MyRectangle {
    id: myChooseButton
    property alias iconSource: myChooseButtonIcon.source
    property alias buttonTitle: myChooseButtonLabel.text

    color: myChooseButtonMA.hoverr? Qt.lighter(MyTheme.chooseButtonTheme.backgroundColor,1.2):MyTheme.chooseButtonTheme.backgroundColor
    realRadius: MyTheme.buttonTheme.buttonRadius
    borderColor: MyTheme.chooseButtonTheme.borderColor
    borderWidth: MyTheme.buttonTheme.borderWidth

    signal clickedOn(chooseButtonId: string)

    MyIcon{
        id: myChooseButtonIcon
        property real maxHeight: 0
        useSourceSize: false
        colorizationColor: MyTheme.chooseButtonTheme.iconColor
        colorization: 1.0
        anchors.horizontalCenter: parent.horizontalCenter
        y: MyTheme.returnOriginalPropertyValue(10+(maxHeight-realHeight)/2)

        function setMaxHeight()
        {
            let mH=myChooseButton.realHeight-10*3-myChooseButtonLabel.realHeight
            myChooseButtonIcon.realHeight=mH
            if(myChooseButtonIcon.realWidth>myChooseButton.realWidth-10*2)
                myChooseButtonIcon.realWidth=myChooseButton.realWidth-10*2
            myChooseButtonIcon.maxHeight=myChooseButtonIcon.realHeight
        }
    }

    MyLabel{
        id: myChooseButtonLabel
        anchors.horizontalCenter: parent.horizontalCenter
        color: MyTheme.chooseButtonTheme.titleColor
        isBold: true
        y: myChooseButton.height-myChooseButtonLabel.height-MyTheme.returnOriginalPropertyValue(10)
        onTextChanged: myChooseButtonIcon.setMaxHeight()
    }

    SequentialAnimation{
        id: myChooseButtonAnim
        NumberAnimation {
            target: myChooseButtonIcon
            property: "realHeight"
            duration: 300
            from: myChooseButtonIcon.maxHeight
            to: myChooseButtonIcon.maxHeight*MyTheme.chooseButtonTheme.animationRatio
        }
        NumberAnimation {
            target: myChooseButtonIcon
            property: "realHeight"
            duration: 300
            from: myChooseButtonIcon.maxHeight*MyTheme.chooseButtonTheme.animationRatio
            to: myChooseButtonIcon.maxHeight
        }
        onStopped: myChooseButtonIcon.realHeight=myChooseButtonIcon.maxHeight
        loops: Animation.Infinite
    }

    MouseArea{
        id: myChooseButtonMA
        property bool hoverr: false
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            hoverr=true
            if(!myChooseButtonAnim.running)
                myChooseButtonAnim.start()
        }

        onExited: {
            hoverr=false
            if(myChooseButtonAnim.running)
                myChooseButtonAnim.stop()
        }

        onClicked: {
            myChooseButton.clickedOn(myChooseButton.buttonTitle)//TODO change to tabID
        }
    }

    Component.onCompleted: {
        myChooseButtonIcon.setMaxHeight()
    }
}
