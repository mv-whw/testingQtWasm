import QtQuick
import "./BasicComponents"
import "./Views"
import "./TabComponents"
import "./KolendarComponents"
MyApplicationWindow {
    id: app
    width: 640
    height: 480
    title: qsTr("Test scaling and my dialogs")

    MyColumn{
        width: parent.width
        MyButton{text: "odpri dialog"; onClicked: tt.open()}
        MyRectangle{
            realWidth: 200
            realHeight: 300
            color: "lightblue"
            MyColumn{
                realSpacing: 2
                anchors.centerIn: parent
                MyLabel{text: "AppWid:"+Math.round(MyTheme.appWindowWidth)}
                MyLabel{text: "AppRWid:"+Math.round(MyTheme.realWindowWidth)}
                MyLabel{text: "rectWid:"+Math.round(parent.width)}
                MyLabel{text: "rectRWid:"+Math.round(parent.realWidth)}
                MyLabel{text: "rectNorScal:"+Math.round(parent.scale)}
                MyLabel{text: "rectMyScal:"+Math.round(MyTheme.itemScaling)}
            }
        }
        MyMessageDialog{id: tt;title: "testn"; messageText: "to je test"; realWidth: 200}
    }


    //MyDatePickerDialog{title: "izberi datum";Component.onCompleted: open(); selectionRule: 1}
    /*KolendarView{

    }*/

    /*MyRotatedTab{
        id: it
        tabTitle: "test"
        y: 200
    }*/

    /*MyColorDialog{
        realWidth: 250
        Component.onCompleted: open()
    }*/

    //LoginView{}

    /*MyChooseButton{
        realHeight: 200
        realWidth: 200
        iconSource: "../Icons/test.svg"
        buttonTitle: "test"
    }*/

    //MyNormalHorTabControl{id: test; y:30}
    //MyButton{y: 100; text: "dodaj tab"; onClicked: console.log(test.createTab("test1","inst"))}

    //MyMessageDialog{realWidth: 200;title: "testna"; messageText: "to sporocilo je malce dolgo moralo bi biti v vec vrsticah"; Component.onCompleted: open()}
    //MyFloatingButton{x:250;y:290;realWidth: 100; realHeight: 100; text: "+"; Component.onCompleted: open()}
    //MyComboBox{model: ["prvi","drugi","tretji", "cetrti","peti"]}
    //MyCheckBox{text: "testing"}

    // MyGroupBox{
    //     title: "testni groupBox"
    //     MyFrame{
    //         MyRectangle{realWidth: 50; realHeight: 20; color: "green"}
    //         MyRectangle{realWidth: 70;realHeight: 50;color: "lightblue"}
    //     }
    // }

    //MyProgressBar{realWidth: 200;progressValue: 20.0; progressInfo: "test"}
    // MySlider{width: 200;from: 0;to: 6; stepSize: 1}
    // MyRangeSlider{y: 50; width: 200; from: 0; to: 6; first.value: 0; second.value: 5}

    // MyHoverDragRectangle{
    //     id: drag
    //     realWidth: 100
    //     realHeight: 100
    //     minimumXmove: -x
    //     maximumXmove: parent.width-width
    //     minimumYmove: -y
    //     maximumYmove: parent.height-height
    //     color:"dodgerblue"
    //     dragTarget: drag
    // }
}
