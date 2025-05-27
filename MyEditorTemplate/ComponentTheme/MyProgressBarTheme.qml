import QtQuick
import "./CommonProgressBarTheme"
import "../"
QtObject {
    property MyProgressBarThemeColorLight lightTheme: MyProgressBarThemeColorLight{}
    property MyProgressBarThemeColorDark darkTheme: MyProgressBarThemeColorDark{}
    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor: lightTheme.backgroundColor
    property color valueColor: MyTheme.useDarkTheme? darkTheme.progressColor:lightTheme.progressColor
    property int progressFontSize: 16
    property int progressInfoFontSize: 14
}
