import QtQuick
import "./NavigationTabs"
import "../../"
QtObject {
    property MyNavTabsColorLight lightTheme: MyNavTabsColorLight{}
    property MyNavTabsColorDark darkTheme: MyNavTabsColorDark{}

    property color backgroundColor: MyTheme.useDarkTheme? darkTheme.backgroundColor:lightTheme.backgroundColor
    property color iconColor: MyTheme.useDarkTheme? darkTheme.iconColor:lightTheme.iconColor
    property color titleColor: MyTheme.useDarkTheme? darkTheme.titleColor:lightTheme.titleColor
    property color selectedBackgroundColor: MyTheme.useDarkTheme? darkTheme.selectedBackgroundColor:lightTheme.selectedBackgroundColor
    property color selectedIconColor: MyTheme.useDarkTheme? darkTheme.selectedIconColor:lightTheme.selectedIconColor
    property color selectedTitleColor: MyTheme.useDarkTheme? darkTheme.selectedTitleColor:lightTheme.selectedTitleColor

    property real fontSize: MyTheme.labelTheme.defaultFontSize-2
    property real tabRadius: MyTheme.buttonTheme.buttonRadius
    property real tabHeight: 40
}
