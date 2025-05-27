import QtQuick
import "./CommonButtonTheme"
import "../"
QtObject {
    property MyButtonThemeColorLight lightTheme: MyButtonThemeColorLight{}
    property MyButtonThemeColorDark darkTheme: MyButtonThemeColorDark{}

    readonly property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    readonly property color fontColor: MyTheme.useDarkTheme? darkTheme.fontColor:lightTheme.fontColor
    readonly property color borderColor: MyTheme.useDarkTheme? darkTheme.borderColor: lightTheme.borderColor

    readonly property real borderWidth: 1
    property int buttonRadius: 10
    property int fontSize: MyTheme.labelTheme.defaultFontSize
}
