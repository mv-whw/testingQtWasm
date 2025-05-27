import QtQuick
import "../"
MyDialog{
    id: colorDialog
    property color selColor: "white"
    isOkVisible: true
    isCancelVisible: true
    title: qsTr("Izberi barvo")

    MyLabel{text: qsTr("izbrana barva:");anchors.horizontalCenter: parent.horizontalCenter}
    MyRectangle{
        id: colorRect
        borderColor: "black"
        borderWidth: 1.4
        realHeight: 150
        realWidth: 150
        color: colorDialog.selColor
        anchors.horizontalCenter: parent.horizontalCenter
    }
    MyLabel{text: qsTr("ime ali hash barve");anchors.horizontalCenter: parent.horizontalCenter}
    MyTextField{id: colName; text: colorDialog.selColor;realWidth: 150;anchors.horizontalCenter: parent.horizontalCenter
        onEditingFinished: {
            try
            {
                let colValue=Qt.color(colName.text)
                colorRect.color=colValue
            }catch(e)
            {
                colorRect.color=colorDialog.selColor
            }
        }
    }

    onClickedOn:(num)=> {
        if(num===0)
            colorDialog.selColor=colorRect.color
        colorDialog.close()
    }
}
