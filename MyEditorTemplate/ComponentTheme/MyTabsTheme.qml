import QtQuick
import "./CommonTabTheme"
QtObject {
    property MyNormalHorTabTheme normalHorTabTheme: MyNormalHorTabTheme{}
    property MyNavTabsTheme navTabsTheme: MyNavTabsTheme{}
    property MyNormalVerTabsTheme normalVerTabTheme: MyNormalVerTabsTheme{}
    property MyRotatedTabsTheme rotatedTabTheme: MyRotatedTabsTheme{}
    property MyCloseButtonTheme closeButtonTheme: MyCloseButtonTheme{}
    readonly property MyTabTypes tabControlTypes: MyTabTypes{}
}
