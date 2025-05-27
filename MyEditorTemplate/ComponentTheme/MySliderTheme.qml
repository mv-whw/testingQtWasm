import QtQuick
import "./CommonSliderTheme"
import "../"
QtObject {
    property MySliderThemeColorLight lightTheme: MySliderThemeColorLight{}
    property MySliderThemeColorDark darkTheme: MySliderThemeColorDark{}
    readonly property color sliderLineColor: MyTheme.useDarkTheme? darkTheme.sliderLineColor:lightTheme.sliderLineColor
    readonly property color sliderValueLineColor: MyTheme.useDarkTheme? darkTheme.sliderValueLineColor:lightTheme.sliderValueLineColor
    readonly property color sliderHandleColor: MyTheme.useDarkTheme? darkTheme.sliderHandleColor:lightTheme.sliderHandleColor

    property bool isHandleCircular: true
    property real handleWidth: 15.0
    property real handleHeight: 30.0
    property real sliderLineHeight: 15.0

}
