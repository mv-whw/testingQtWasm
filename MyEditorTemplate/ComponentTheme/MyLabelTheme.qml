import QtQuick
import "./CommonLabelTheme"
import "../"
QtObject {
    property MyLabelThemeColorLight lightTheme: MyLabelThemeColorLight{}
    property MyLabelThemeColorDark darkTheme: MyLabelThemeColorDark{}

    readonly property color fontColor: MyTheme.useDarkTheme? darkTheme.fontColor: lightTheme.fontColor

    property int defaultFontSize: 14
}
