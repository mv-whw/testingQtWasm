import QtQuick
import "./NormalVerticalTabs"
QtObject {

    property MyNormalVerticalTabsColorLight lightTheme: MyNormalVerticalTabsColorLight{}
    property MyNormalVerticalTabsColorDark darkTheme: MyNormalVerticalTabsColorDark{}

    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    property color iconColor: MyTheme.useDarkTheme? darkTheme.iconColor:lightTheme.iconColor
    property color titleColor: MyTheme.useDarkTheme? darkTheme.titleColor:lightTheme.titleColor
    property color selectedBackgroundColor: MyTheme.useDarkTheme? darkTheme.selectedBackgroundColor:lightTheme.selectedBackgroundColor
    property color selectedIconColor: MyTheme.useDarkTheme? darkTheme.selectedIconColor:lightTheme.selectedIconColor
    property color selectedTitleColor: MyTheme.useDarkTheme? darkTheme.selectedTitleColor:lightTheme.selectedTitleColor

    property real fontSize: MyTheme.labelTheme.defaultFontSize
    property real defaultTabWidth: 150
    property real tabHeight: 50
    property real tabRadius: MyTheme.buttonTheme.buttonRadius
    property real iconTabRatio: 0.9
}
