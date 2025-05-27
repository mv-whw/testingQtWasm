import QtQuick
import QtQuick.Controls.Basic
import "../"
MyRow{
    id: txtFieldRow
    property alias placeholderText: txtField.placeholderText
    property alias text: txtField.text
    property bool isPassword: false

    signal editingFinished()
    realSpacing: 4
    TextField{
        id: txtField
        width: parent.width-(closeB.visible? closeB.width+parent.spacing:0)
        height: MyTheme.returnOriginalPropertyValue(40)
        background: MyRectangle{
            color: MyTheme.textImputsTheme.backgroundColor
            borderColor: txtField.focus? MyTheme.textImputsTheme.selectedBorderColor:MyTheme.textImputsTheme.borderColor
            borderWidth: txtField.focus? 3.0:1.0
            realRadius: 10
        }
        onEditingFinished:{ txtField.focus=false; txtFieldRow.editingFinished()}
        selectByMouse: true
        selectedTextColor: MyTheme.textImputsTheme.fontColorSelected
        selectionColor: MyTheme.textImputsTheme.selectedBackgroundColor
        placeholderTextColor: MyTheme.textImputsTheme.placeholderColor
        color: MyTheme.textImputsTheme.fontColor
        font.pixelSize: MyTheme.useSpValues? MyTheme.calcToSpValue(MyTheme.textImputsTheme.fontSize):MyTheme.textImputsTheme.fontSize*MyTheme.fontScaling
        echoMode: txtFieldRow.isPassword? TextField.Password:TextField.Normal

    }
    MySimpleButton{
        id: closeB
        visible: txtField.text!==""
        width: parent.height
        height: parent.height
        text: "X"
        borderWidth: 1.0
        borderColor: closeB.color
        color: MyTheme.useDarkTheme? "dodgerblue":"lightblue"
        onClicked: {
            txtField.clear()
            txtField.focus=true
        }
    }
}
