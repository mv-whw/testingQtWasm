import QtQuick
import "../"
MyPopUp {
    id: myFloatingButton
    property alias text: floatButtonLabel.text
    background: MyRectangle{
        color: MyTheme.buttonTheme.backgroundColor
        realRadius: MyTheme.buttonTheme.buttonRadius
    }
    closePolicy: MyPopUp.NoAutoClose
    modal: false
    padding: 0
    margins: 0

    signal clickedOn()


    MyLabel{
        id: floatButtonLabel
        fontSize: MyTheme.buttonTheme.fontSize
        color: MyTheme.buttonTheme.fontColor
        anchors.centerIn: parent
        isBold: true
    }

    MouseArea{
        property point origin
        property bool isMoved: false
        anchors.fill: parent

        onClicked: {
            if(!isMoved)
                myFloatingButton.clickedOn()
            else
                isMoved=false
        }

        onPressed: {
            origin.x=mouseX
            origin.y=mouseY
        }

        onMouseXChanged: {
            if(pressed)
            {
                let nDX=myFloatingButton.x+mouseX-origin.x
                if(nDX>=0.0 && nDX<=(myFloatingButton.parent.width-myFloatingButton.width))
                {
                    if(myFloatingButton.x!==nDX)
                    {
                        myFloatingButton.x=nDX
                        if(!isMoved)
                            isMoved=true
                    }
                }
            }
        }

        onMouseYChanged: {
            if(pressed)
            {
                let nDY=myFloatingButton.y+mouseY-origin.y
                if(nDY>=0.0 && nDY<=(myFloatingButton.parent.height-myFloatingButton.height))
                {
                    if(myFloatingButton.y!==nDY)
                    {
                        myFloatingButton.y=nDY
                        if(!isMoved)
                            isMoved=true
                    }
                }
            }
        }
    }
}
