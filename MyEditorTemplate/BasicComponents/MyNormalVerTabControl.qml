import QtQuick
import "../TabComponents"
import "../"
MyTabControl {
    id: myNormalVertTabControl
    property Component tabComp: MyNormalTabHorizontal{}

    MyFlickable{
        anchors.fill: parent
        MyColumn{
            id: myNormalVertTabControlCon
            realWidth: parent.realWidth

        }
    }
}
