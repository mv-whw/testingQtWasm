import QtQuick
import "./CommonSwitchTheme"
import "../"
QtObject {
    property MySwitchThemeColorLight lightTheme: MySwitchThemeColorLight{}
    property MySwitchThemeColorDark darkTheme: MySwitchThemeColorDark{}

    readonly property color switchCheckedColor: MyTheme.useDarkTheme? darkTheme.switchCheckedColor:lightTheme.switchCheckedColor
    readonly property color switchUnCheckedColor: MyTheme.useDarkTheme? darkTheme.switchUnCheckedColor:lightTheme.switchUnCheckedColor
    readonly property color switchSliderColor: MyTheme.useDarkTheme? darkTheme.switchSliderColor:lightTheme.switchSliderColor
    readonly property color switchBorderColor: MyTheme.useDarkTheme? darkTheme.switchBorderColor:lightTheme.switchBorderColor
    property real borderWidth: 1.0
    property int animationSpeed: 250
}
