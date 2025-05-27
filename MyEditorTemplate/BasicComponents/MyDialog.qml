import QtQuick
import QtQuick.Controls.Basic
import "../"
Popup {
    id: myDialog
    closePolicy: Popup.NoAutoClose
    padding: 0
    modal: true
    Overlay.modal: MyRectangle{
        color: MyTheme.useDarkTheme? Qt.rgba(0.0,0.0,0.0,0.8): Qt.rgba(0.5,0.5,0.5,0.8)
    }
    height: dialogCont.height

    property string title: "naslov"
    property alias headerIcon: headerIcon.source
    default property alias bodyItems: contentInside.children
    property alias isOkVisible: okBtn.visible
    property alias isRetryVisible: retryBtn.visible
    property alias isApplyVisible: applyBtn.visible
    property alias isSaveVisible: saveBtn.visible
    property alias isCancelVisible: cancelBtn.visible
    property real realWidth: MyTheme.returnRealPropertyValue(myDialog.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myDialog.height)
    readonly property real parentRWidth: MyTheme.returnRealPropertyValue(parent.width)

    signal clickedOn(index: int)

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myDialog.width)
        if(rW!==myDialog.realWidth)
            myDialog.realWidth=rW
    }

    onRealWidthChanged: {
        let nW=MyTheme.returnOriginalPropertyValue(myDialog.realWidth)
        if(nW!==myDialog.width)
            myDialog.width=nW
    }

    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myDialog.height)
        if(rH!==myDialog.realHeight)
            myDialog.realHeight=rH
    }

    onRealHeightChanged: {
        let nH=MyTheme.returnOriginalPropertyValue(myDialog.realHeight)
        if(nH!==myDialog.height)
            myDialog.height=nH
    }

    background: MyRectangle{
        color: MyTheme.dialogTheme.bodyColor
        realRadius: MyTheme.dialogTheme.dialogRadius
    }

    MyColumn{
        id: dialogCont
        realWidth: myDialog.realWidth
        realSpacing: 10
        MyRectangle{
            id: head
            color: MyTheme.dialogTheme.headerColor
            realWidth: myDialog.realWidth
            realHeight: MyTheme.dialogTheme.headerHeight
            realRadius: MyTheme.dialogTheme.dialogRadius
            bottomLeftRadius: 0.0
            bottomRightRadius: 0.0

            MyRow{
                realSpacing: 5
                anchors.centerIn: parent
                MyIcon{
                    id: headerIcon
                    useSourceSize: false
                    height: headTxt.height
                    visible: source!==""
                }
                MyLabel{
                    id: headTxt
                    fontSize: 14
                    color: MyTheme.dialogTheme.headerTextColor
                    text: myDialog.title
                    isBold: true
                }
            }
            MouseArea{
                anchors.fill: parent
                property point dxy

                onPressed: (mouse)=>{
                               dxy=head.mapFromItem(parent,mouse.x,mouse.y)
                           }

                onMouseXChanged: {
                    let nX=myDialog.x+(mouseX-dxy.x)
                    if(nX>=0 && nX<(myDialog.parent.width-myDialog.width))
                        myDialog.x=nX
                }
                onMouseYChanged: {
                    let nY=myDialog.y+(mouseY-dxy.y)
                    if(nY>=0 && nY<(myDialog.parent.height-myDialog.height))
                        myDialog.y=nY
                }
            }
        }
        MyColumn{
            id: contentInside
            anchors.horizontalCenter: parent.horizontalCenter
            realSpacing: 5
        }
        MyRow
        {
            id: buttonCon
            bottomPadding: 10
            rightPadding: 10
            realSpacing: 2
            anchors.right: parent.right
            MyButton{id: okBtn;visible: true;text: qsTr("Ok"); onClicked: myDialog.clickedOn(0)}
            MyButton{id: applyBtn;visible: false;text: qsTr("Apply"); onClicked: myDialog.clickedOn(1)}
            MyButton{id: saveBtn;visible: false;text: qsTr("Save"); onClicked: myDialog.clickedOn(2)}
            MyButton{id: retryBtn;visible: false;text: qsTr("Retry"); onClicked: myDialog.clickedOn(3)}
            MyButton{id: cancelBtn;visible: false;text: qsTr("Cancel"); onClicked: myDialog.clickedOn(4)}
        }
    }
}
