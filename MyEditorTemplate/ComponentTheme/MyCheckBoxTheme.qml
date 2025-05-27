import QtQuick
import "./CommonCheckBoxTheme"
import "../"
QtObject {
    property MyCheckBoxColorThemeLight lightTheme: MyCheckBoxColorThemeLight{}
    property MyCheckBoxColorThemeDark darkTheme: MyCheckBoxColorThemeDark{}
    readonly property color borderColor: MyTheme.useDarkTheme? darkTheme.borderColor:lightTheme.borderColor
    readonly property color checkRectColor: MyTheme.useDarkTheme? darkTheme.checkRectColor:lightTheme.checkRectColor
    readonly property color checkedRectColor: MyTheme.useDarkTheme? darkTheme.checkedRectColor:lightTheme.checkedRectColor
    readonly property color textColor: MyTheme.useDarkTheme? darkTheme.textColor:lightTheme.textColor

    property int fontSize: MyTheme.labelTheme.defaultFontSize
    property real borderWidth: 1.5
}
