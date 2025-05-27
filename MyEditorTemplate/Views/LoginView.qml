import QtQuick 2.15
import "../BasicComponents"
import "../"
MyPage {
    id: myLoginView
    anchors.fill: parent

    MyMessageDialog{id: loginMessegeD;
        //realWidth: 600
        title: qsTr("Error")
        messageText:qsTr("Cannot connect to App server, posible invalid connection Data")
    }

    MyColumn{
        anchors.centerIn: parent
        realSpacing: 10
        MyLabel{x: MyTheme.returnOriginalPropertyValue(10);text: qsTr("userName:")}
        MyTextField{id: uname; realWidth: 200}
        MyLabel{x: MyTheme.returnOriginalPropertyValue(10);text: qsTr("userPassword:")}
        MyTextField{id: upass; realWidth: 200; isPassword: true}
        MyLabel{x: MyTheme.returnOriginalPropertyValue(10);text: qsTr("app address:")}
        MyTextField{id: appLocation; realWidth: 200}
        MyLabel{x: MyTheme.returnOriginalPropertyValue(10);text: qsTr("userRole:")}
        MyTextField{id: appRole; realWidth: 200}
        MyButton{
            realWidth: 150
            text: qsTr("Connect me")
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                loginMessegeD.open()//TODO add logic for login
            }
        }
    }
}
