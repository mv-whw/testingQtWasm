import QtQuick
import QtQuick.Controls.Basic
import "../"
CheckBox {
    id: myCheckBox
    text: qsTr("CheckBox")
    checked: true

    indicator: MyRectangle {
        width: myCheckBox.height-myCheckBox.height/5
        height: myCheckBox.height-myCheckBox.height/5
        x: myCheckBox.leftPadding
        y: parent.height / 2 - height / 2
        realRadius: 5
        borderWidth: MyTheme.checkBoxTheme.borderWidth
        borderColor: MyTheme.checkBoxTheme.borderColor
        color: MyTheme.checkBoxTheme.checkRectColor

        MyRectangle {
            width: parent.width-parent.width/3
            height: parent.height-parent.height/3
            anchors.centerIn: parent
            realRadius: 5
            color: MyTheme.checkBoxTheme.checkedRectColor
            visible: myCheckBox.checked
        }
    }

    contentItem: MyLabel {
        text: myCheckBox.text
        fontSize: MyTheme.checkBoxTheme.fontSize
        opacity: enabled ? 1.0 : 0.3
        color: MyTheme.checkBoxTheme.textColor
        verticalAlignment: Text.AlignVCenter
        leftPadding: myCheckBox.indicator.width + myCheckBox.spacing
    }
}
