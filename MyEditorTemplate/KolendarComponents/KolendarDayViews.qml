import QtQuick
import "../BasicComponents"
import "../"
MyGrid {
    id: myKolGrid
    width: parent.width
    columns: 7
    realSpacing: 4
    property int selectedDate: MyTheme.dateHelper.getCurrentDate()
    property bool useSmallValues: (MyTheme.realWindowWidth<280)

    MyLabel{text: useSmallValues? qsTr("Po"): qsTr("Pon");isBold:true}
    MyLabel{text: useSmallValues? qsTr("To"): qsTr("Tor");isBold:true}
    MyLabel{text: useSmallValues? qsTr("Sr"): qsTr("Sre");isBold:true}
    MyLabel{text: useSmallValues? qsTr("Ce"): qsTr("Cet");isBold:true}
    MyLabel{text: useSmallValues? qsTr("Pe"): qsTr("Pet");isBold:true}
    MyLabel{text: useSmallValues? qsTr("So"): qsTr("Sob");isBold:true}
    MyLabel{text: useSmallValues? qsTr("Ne"): qsTr("Ned");isBold:true}



    Component.onCompleted: {
        for(let i=0;i<6;i++)
            Qt.createQmlObject("import QtQuick; Item{width:1;height:1}",myKolGrid,'blankObjectInsertions')
        for(let j=1;j<32;j++)
            Qt.createQmlObject('DayComponent{isSelected: '+(myKolGrid.selectedDate==j)+';dayValue:"'+j+'";width: (myKolGrid.width-6*myKolGrid.spacing)/7; height: (myKolGrid.width-6*myKolGrid.spacing)/7 }',myKolGrid,'daysInsertions')

    }
}
