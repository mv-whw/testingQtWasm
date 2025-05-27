import QtQuick
import "../"
import "../BasicComponents"
MyRectangle {
    id: myBusyIndicatorBall

    realHeight: MyTheme.busyIndicatorTheme.ballSize
    realWidth: MyTheme.busyIndicatorTheme.ballSize
    color: MyTheme.busyIndicatorTheme.ballColor
    realRadius: MyTheme.busyIndicatorTheme.ballSize
    borderColor: MyTheme.busyIndicatorTheme.ballBorderColor
    borderWidth: MyTheme.busyIndicatorTheme.borderWidth

}
