import QtQuick
import QtQuick.Controls.Basic
import "../"
MyScrollView{
    id: myAreaScrool
    property alias placeholderText: myArea.placeholderText
    property alias text: myArea.text
    property alias lineCount: myArea.lineCount


    TextArea {
        id: myArea
        background: MyRectangle{
            id: back
            color: MyTheme.textImputsTheme.backgroundColor
            borderColor: myArea.focus? MyTheme.textImputsTheme.selectedBorderColor:MyTheme.textImputsTheme.borderColor
            borderWidth: myArea.focus? 3.0:1.0
            realRadius: 10
        }

        onEditingFinished: myArea.focus=false
        selectByMouse: true
        selectedTextColor: MyTheme.textImputsTheme.fontColorSelected
        selectionColor: MyTheme.textImputsTheme.selectedBackgroundColor
        placeholderTextColor: MyTheme.textImputsTheme.placeholderColor
        color: MyTheme.textImputsTheme.fontColor
        font.pixelSize: MyTheme.useSpValues? MyTheme.calcToSpValue(MyTheme.textImputsTheme.fontSize) : MyTheme.textImputsTheme.fontSize*MyTheme.fontScaling
    }
}
