pragma Singleton
import QtQuick
import "./ComponentTheme"
import "./KolendarComponents"
QtObject {
    property bool useDarkTheme: false
    property bool useSpValues: true
    property bool useDpValues: true
    property real itemScaling: 1.0
    property real fontScaling: 1.0
    readonly property real dpIndex: (32.0*Screen.pixelDensity)/160.0
    readonly property real spIndex: ((32.0*Screen.pixelDensity)/160.0)*1.4375//dpIndex*1.4375
    property bool isLandscapeMode: true
    property int appWindowWidth: 0
    property int appWindowHeight: 0
    readonly property real realWindowWidth: returnRealPropertyValue(appWindowWidth)
    readonly property real realWindowHeight: returnRealPropertyValue(appWindowHeight)

    property string platformOS: ""
    readonly property bool isWindows: platformOS==="windows"
    readonly property bool isLinux: platformOS==="linux"
    readonly property bool isMacOs: platformOS==="osx"
    readonly property bool isWasm: platformOS==="wasm"
    readonly property bool isAndroid: platformOS==="android"
    readonly property bool isIos: platformOS==="ios"
    readonly property bool isDesktop: (isWindows || isLinux || isMacOs || isWasm)
    readonly property bool isMobile: (isAndroid || isIos)
    readonly property bool isOtherOs: (!isDesktop && !isMobile)

    function calcToDpValue(value: real):real
    {
        return value*dpIndex*itemScaling
    }

    function calcFromDpValue(value: real): real
    {
        return ((value/dpIndex)/itemScaling)
    }

    function calcToSpValue(value: real): real
    {
        return value*spIndex*fontScaling
    }

    function calcFromSpValue(value: real): real
    {
        return ((value/spIndex)/fontScaling)
    }

    function returnRealPropertyValue(originalPropertyValue: real):real
    {
        return (useDpValues? calcFromDpValue(originalPropertyValue):originalPropertyValue)
    }
    function returnOriginalPropertyValue(realPropertyValue: real):real
    {
        return (useDpValues? calcToDpValue(realPropertyValue):realPropertyValue)
    }
    property KolendarHelper dateHelper: KolendarHelper{}


    property MyWindowPageTheme windowPageTheme: MyWindowPageTheme{}
    property MyLabelTheme labelTheme: MyLabelTheme{}
    property MyButtonTheme buttonTheme: MyButtonTheme{}
    property MyDialogTheme dialogTheme: MyDialogTheme{}
    property MyTextFieldAreaTheme textImputsTheme: MyTextFieldAreaTheme{}
    property MySwitchTheme switchTheme: MySwitchTheme{}
    property MySliderTheme sliderTheme: MySliderTheme{}
    property MyProgressBarTheme progressBarTheme: MyProgressBarTheme{}
    property MyPopUpTheme popUpTheme: MyPopUpTheme{}
    property MyFrameTheme frameTheme: MyFrameTheme{}
    property MyGroupBoxTheme groupBoxTheme: MyGroupBoxTheme{}
    property MyBusyIndicatorTheme busyIndicatorTheme: MyBusyIndicatorTheme{}
    property MyCheckBoxTheme checkBoxTheme: MyCheckBoxTheme{}
    property MyTabsTheme tabTheme: MyTabsTheme{}
    property MyChooseButtonTheme chooseButtonTheme: MyChooseButtonTheme{}
}
