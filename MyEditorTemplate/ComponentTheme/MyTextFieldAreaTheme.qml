import QtQuick
import "./CommonTextFieldAndAreaTheme"
import "../"
QtObject {
    property MyTextFieldAreaColorLight lightTheme: MyTextFieldAreaColorLight{}
    property MyTextFieldAreaColorDark darkTheme: MyTextFieldAreaColorDark{}

    readonly property color borderColor: MyTheme.useDarkTheme? darkTheme.borderColor:lightTheme.borderColor
    readonly property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    readonly property color placeholderColor: MyTheme.useDarkTheme? darkTheme.placeholderColor:lightTheme.placeholderColor
    readonly property color fontColor: MyTheme.useDarkTheme? darkTheme.fontColor:lightTheme.fontColor
    readonly property color fontColorSelected: MyTheme.useDarkTheme? darkTheme.fontColorSelected:lightTheme.fontColorSelected
    readonly property color selectedBackgroundColor: MyTheme.useDarkTheme? darkTheme.selectedBackgroundColor:lightTheme.selectedBackgroundColor
    readonly property color selectedBorderColor: MyTheme.useDarkTheme? darkTheme.selectedBorderColor:lightTheme.selectedBorderColor
    property int fontSize: 12
}
