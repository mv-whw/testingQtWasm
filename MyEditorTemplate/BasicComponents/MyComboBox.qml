import QtQuick
import QtQuick.Controls.Basic
import "../"
ComboBox {
    id: myComboBox

    property real realWidth: MyTheme.returnRealPropertyValue(myComboBox.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myComboBox.height)

    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myComboBox.realHeight)
        if(nh!==myComboBox.height)
            myComboBox.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myComboBox.height)
        if(rH!==myComboBox.realHeight)
            myComboBox.realHeight=rH
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myComboBox.realWidth)
        if(nW!==myComboBox.width)
            myComboBox.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myComboBox.width)
        if(rW!==myComboBox.realWidth)
            myComboBox.realWidth=rW
    }


    indicator: Canvas {
        id: canvas
        property bool theme: MyTheme.useDarkTheme
        x: myComboBox.width - width - myComboBox.rightPadding*MyTheme.dpIndex
        y: myComboBox.topPadding*MyTheme.dpIndex + (myComboBox.availableHeight - height) / 2
        width: ((myComboBox.background.height/10)*3) *(MyTheme.useDpValues? MyTheme.dpIndex:1)//12
        height: (myComboBox.background.height/5) *(MyTheme.useDpValues? MyTheme.dpIndex:1)//8
        contextType: "2d"

        onThemeChanged: canvas.requestPaint()

        onPaint: {
            context.reset();
            context.moveTo(0, 0);
            context.lineTo(width, 0);
            context.lineTo(width / 2, height);
            context.closePath();
            context.fillStyle = canvas.theme ? "white" : "black";
            context.fill();
        }
    }

    contentItem: MyLabel {
        leftPadding: MyTheme.useDpValues? MyTheme.dpIndex*10:10
        rightPadding: myComboBox.indicator.width + myComboBox.spacing*MyTheme.dpIndex
        text: myComboBox.displayText
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: MyRectangle {
        implicitHeight: 40
        implicitWidth: implicitHeight*3
        color: MyTheme.useDarkTheme? "grey":"white"
        borderColor: MyTheme.frameTheme.frameBorderColor
        borderWidth: 1.4
        realRadius: 10
    }

    popup: MyPopUp {
        y: myComboBox.height - 1*MyTheme.dpIndex
        width: myComboBox.width
        implicitHeight: contentItem.implicitHeight
        padding: 3
        clip:true
        contentItem:ListView {
            clip: true
            implicitHeight: contentHeight
            model: myComboBox.popup.visible ? myComboBox.delegateModel : null
            currentIndex: myComboBox.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    delegate: ItemDelegate{
        id: delegate
        clip:true
        required property var model
        required property var index
        width: myComboBox.width
        contentItem: MyRectangle{
            anchors.fill:parent
            realRadius: 10//----------------------------------------------------------------
            MyLabel{
                id:selTxt
                x: 10
                anchors.verticalCenter:parent.verticalCenter
                text: delegate.model[myComboBox.textRole]
                color: "black"
                enableElideMode: true
                //verticalAlignment: MyLabel.AlignVCenter
            }
        }
        highlighted: myComboBox.highlightedIndex===index
        onHighlightedChanged: {
            /*contentItem*/selTxt.isBold=(delegate.index===myComboBox.currentIndex)
            /*contentItem*/selTxt.color=highlighted? (MyTheme.useDarkTheme? "black":"white"):"black"
            contentItem.color/*backgroundColor*/=(highlighted? "limegreen":"transparent")
        }
    }
}
