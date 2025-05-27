import QtQuick
import "./CommonFrameTheme"
import "../"
QtObject {
    property MyFrameThemeColorLight lightTheme: MyFrameThemeColorLight{}
    property MyFrameThemeColorDark darkTheme: MyFrameThemeColorDark{}

    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    property color frameBorderColor: MyTheme.useDarkTheme? darkTheme.frameBorderColor:lightTheme.frameBorderColor

    property real borderWidth: 1.7
    property real radius: 10
    property real itemsSpacing: 10
}
