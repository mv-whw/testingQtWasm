import QtQuick
import "./RotatedTabs"
import "../../"
QtObject {
    property MyRotatedTabsColorLight lightTheme:MyRotatedTabsColorLight{}
    property MyRotatedTabsColorDark darkTheme: MyRotatedTabsColorDark{}

    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    property color titleColor: MyTheme.useDarkTheme? darkTheme.titleColor:lightTheme.titleColor
    property color selectedBackgroundColor: MyTheme.useDarkTheme? darkTheme.selectedBackgroundColor:lightTheme.selectedBackgroundColor
    property color selectedTitleColor: MyTheme.useDarkTheme? darkTheme.selectedTitleColor:lightTheme.selectedTitleColor

    property real fontSize: MyTheme.labelTheme.defaultFontSize
    property real defaultTabHeight: 120
    property real defaultTabWidth: 40
    property real tabRadius: MyTheme.buttonTheme.buttonRadius
}
