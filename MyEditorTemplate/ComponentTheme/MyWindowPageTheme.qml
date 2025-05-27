import QtQuick
import "../"
import "./CommonWindowPageTheme"
QtObject {
    id: myAppCommonTheme
    property MyWindowPageThemeColorDark darkTheme: MyWindowPageThemeColorDark{}
    property MyWindowPageThemeColorLight lightTheme: MyWindowPageThemeColorLight{}
    
    readonly property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
}
