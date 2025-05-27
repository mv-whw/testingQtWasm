import QtQuick
import "./CommonDialogTheme"
import "../"
QtObject {
    property MyDialogThemeColorLight lightTheme: MyDialogThemeColorLight{}
    property MyDialogThemeColorDark darkTheme: MyDialogThemeColorDark{}

    readonly property color headerColor: MyTheme.useDarkTheme? darkTheme.headerColor: lightTheme.headerColor
    readonly property color bodyColor: MyTheme.useDarkTheme? darkTheme.bodyColor: lightTheme.bodyColor
    readonly property color headerTextColor: MyTheme.useDarkTheme? darkTheme.headerTextColor:lightTheme.headerTextColor
    readonly property color bodyTextColor: MyTheme.useDarkTheme? darkTheme.bodyTextColor: lightTheme.bodyTextColor

    property int dialogRadius: 10
    property int headerHeight: 40
}
