import QtQuick
import "./CommonChooseButtonTheme"
import "../"
QtObject {
    property MyChooseButtonColorLight lightTheme: MyChooseButtonColorLight{}
    property MyChooseButtonColorDark darkTheme: MyChooseButtonColorDark{}

    readonly property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    readonly property color titleColor: MyTheme.useDarkTheme? darkTheme.titleColor:lightTheme.titleColor
    readonly property color borderColor: MyTheme.useDarkTheme? darkTheme.borderColor:lightTheme.borderColor
    readonly property color iconColor: MyTheme.useDarkTheme? darkTheme.iconColor:lightTheme.iconColor

    property real fontSize: MyTheme.labelTheme.defaultFontSize-2
    property real animationRatio: 0.9
}
