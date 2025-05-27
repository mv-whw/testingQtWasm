import QtQuick
import "../"
import "./CommonPopUpTheme"
QtObject {
    property MyPopUpThemeColorLight lightTheme: MyPopUpThemeColorLight{}
    property MyPopUpThemeColorDark darkTheme: MyPopUpThemeColorDark{}
    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    property color backgroundBorderColor: MyTheme.useDarkTheme? darkTheme.backgroundBorderColor:lightTheme.backgroundBorderColor
    property int radius: 10
    property real borderWidth: 1.4
}
