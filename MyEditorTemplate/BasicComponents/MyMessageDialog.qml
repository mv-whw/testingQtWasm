import QtQuick
import "../"
MyDialog {
    id: msgDialog
    property alias messageText: msgText.text


    onParentRWidthChanged: {
        setDialogDim()
        if((msgDialog.x+msgDialog.width)>msgDialog.parent.width)
            msgDialog.x=msgDialog.parent.width-msgDialog.width
    }

    function setDialogDim():void
    {
        if(msgText.realWidth>msgDialog.realWidth)
        {
            if(parentRWidth>420)
                msgDialog.realWidth=400
            else
            {
                if(parentRWidth<=280)
                    msgDialog.realWidth=230
                else
                    msgDialog.realWidth=parentRWidth/4*3
            }
        }
        msgText.setMsgDimensions()
    }

    MyLabel{
        id: msgText
        color: MyTheme.dialogTheme.bodyTextColor
        anchors.horizontalCenter: parent.horizontalCenter
        enableElideMode: false
        onTextChanged: {
            setDialogDim()
        }
        Component.onCompleted: {
            setDialogDim()
        }

        function setMsgDimensions(): void
        {
            msgText.realWidth=msgDialog.realWidth
            if(MyTheme.returnRealPropertyValue(msgText.contentWidth)<msgText.realWidth)
                msgText.realWidth=MyTheme.returnRealPropertyValue(msgText.contentWidth)
            if(msgText.realWidth>(msgDialog.realWidth-20))
                msgText.realWidth=(msgDialog.realWidth-20)
        }
    }

    onClickedOn: {
        msgDialog.close()
    }

    Component.onCompleted: {
        setDialogDim()
    }
}
