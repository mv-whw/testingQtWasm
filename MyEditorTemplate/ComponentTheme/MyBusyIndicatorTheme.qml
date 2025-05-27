import QtQuick
import "./CommonBusyIndicatorTheme"
import "../"
QtObject {
    property MyBusyIndicatorThemeColorLight lightTheme: MyBusyIndicatorThemeColorLight{}
    property MyBusyIndicatorThemeColorDark darkTheme: MyBusyIndicatorThemeColorDark{}

    readonly property color ballColor: MyTheme.useDarkTheme? darkTheme.ballColor:lightTheme.ballColor
    readonly property color ballBorderColor: MyTheme.useDarkTheme? darkTheme.ballBorderColor:lightTheme.ballBorderColor
    property real borderWidth: 1.5
    property real baseRectWidth: 180
    property real ballSize: 20
}
