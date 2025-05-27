import QtQuick
import QtQuick.Controls.Basic
import "../"
ScrollView {
    id: scrollView
    property real realWidth: MyTheme.returnRealPropertyValue(scrollView.width)
    property real realHeight: MyTheme.returnRealPropertyValue(scrollView.height)

    onRealHeightChanged: scrollView.height=MyTheme.returnOriginalPropertyValue(scrollView.realHeight)
    onRealWidthChanged: scrollView.width=MyTheme.returnOriginalPropertyValue(scrollView.realWidth)
    onHeightChanged: scrollView.realHeight=MyTheme.returnRealPropertyValue(scrollView.height)
    onWidthChanged: scrollView.realWidth=MyTheme.returnRealPropertyValue(scrollView.width)

}
