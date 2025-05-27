import QtQuick
import QtQuick.Controls.Basic
import "../"
MyColumn{
    id: myProgCol

    property alias progressValue: myProgressBar.value
    property alias progressInfo: myProgressInfo.text
    MyRow
    {
        id: myProgRow
        realSpacing: 5
        realWidth: parent.realWidth
        ProgressBar {
            id: myProgressBar
            from: 0.0
            to: 100.0
            width: parent.width

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                color: MyTheme.progressBarTheme.backgroundColor
                radius: height/4
            }

            contentItem: Item {
                implicitWidth: 100
                implicitHeight: 40

                // Progress indicator for determinate state.
                Rectangle {
                    width: myProgressBar.visualPosition * parent.width
                    height: parent.height
                    radius: height/4
                    color: MyTheme.progressBarTheme.valueColor
                }
            }

        }
        MyLabel{
            id: myProgProcent
            fontSize: MyTheme.progressBarTheme.progressFontSize
            text: Math.ceil(myProgressBar.value)+"%"
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    MyLabel{
        id: myProgressInfo
        enableElideMode: false
        width: parent.width
        fontSize: MyTheme.progressBarTheme.progressInfoFontSize
    }
}
