import QtQuick
import "../"
import "../BusyIndicatorComponents"
MyRectangle {
    id: myBusyIndicator
    realWidth: MyTheme.busyIndicatorTheme.baseRectWidth
    color: "transparent"
    clip: true
    realHeight: b1.realHeight

    onVisibleChanged: {
        if(myBusyIndicator.visible)
        {
            if(!ballsAnim.running)
                ballsAnim.start()
        }
        else
            if(ballsAnim.running)
                ballsAnim.stop()
    }

    Balls{
        id: b1
        x: -width
    }
    Balls{
        id: b2
        x:-2*width-width/2
    }
    Balls{
        id: b3
        x: -4*width
    }
    Balls{
        id: b4
        x: -4*width-3*width/2
    }

    SequentialAnimation{
        id: ballsAnim
        loops: Animation.Infinite
        ParallelAnimation{

            NumberAnimation {
                target: b1
                property: "x"
                duration: 550
                from: -b1.width
                to: 3*b1.width+3*b1.width/2
            }
            NumberAnimation {
                target: b2
                property: "x"
                duration: 550
                from: -2*b2.width-b2.width/2
                to: 3*b2.width
            }
            NumberAnimation {
                target: b3
                property: "x"
                duration: 550
                from: -4*b3.width
                to: b3.width+b3.width/2
            }
            NumberAnimation {
                target: b4
                property: "x"
                duration: 550
                from: -4*b4.width-3*b4.width/2
                to: 0
            }
        }

        SequentialAnimation{
            NumberAnimation {
                target: b1
                property: "x"
                duration: 550
                to: myBusyIndicator.width+4*b1.width+b1.width/2
            }
            NumberAnimation {
                target: b2
                property: "x"
                duration: 550
                to: myBusyIndicator.width+3*b2.width
            }
            NumberAnimation {
                target: b3
                property: "x"
                duration: 550
                to: myBusyIndicator.width+b3.width+b3.width/2
            }
            NumberAnimation {
                target: b4
                property: "x"
                duration: 550
                to: myBusyIndicator.width
            }
        }
    }

    Component.onCompleted: {
        if(myBusyIndicator.visible)
            if(!ballsAnim.running)
                ballsAnim.start()
    }
}
