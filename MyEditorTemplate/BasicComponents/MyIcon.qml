import QtQuick
import QtQuick.Effects
import "../"

Item{
    property alias useSourceSize: myIcon.useSourceSize
    property alias blurEnabled: myIconEffects.blurEnabled
    property alias blur: myIconEffects.blur
    property alias colorization: myIconEffects.colorization
    property alias colorizationColor: myIconEffects.colorizationColor
    property alias source: myIcon.source
    property alias realWidth: myIcon.realWidth
    property alias realHeight: myIcon.realHeight
    property alias status: myIcon.status
    property alias isLoaded: myIcon.isReady

    MyImage {
        id: myIcon
        visible: false
        onWidthChanged:{
            parent.width=myIcon.width
        }
        onHeightChanged:{
            parent.height=myIcon.height
        }
        fillMode: MyImage.PreserveAspectFit
    }
    MultiEffect{
        id: myIconEffects
        anchors.fill: parent
        source: myIcon
    }
}
