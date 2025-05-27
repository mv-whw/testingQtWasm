import QtQuick
import "../BasicComponents"
MyRow{
    id: conKonPanel
    width: parent.width
    property alias isMonthDataPanel: dataP.isMonthData
    property alias dataValue: dataP.value

    signal overflow(backOverflow: bool)
    NavButton{
        id: bButt
        isBackButton: true
        onClickedOn: {
            if(dataP.isMonthData && dataP.value===1)
            {
                dataP.value=12
                conKonPanel.overflow(true)
            }else
                dataP.value--
        }
    }
    DataPanel{
        id: dataP
        width: conKonPanel.width-2*bButt.width
    }
    NavButton{
        isBackButton: false
        onClickedOn: {
            if(dataP.isMonthData && dataP.value===12)
            {
                dataP.value=1
                conKonPanel.overflow(false)
            }else
                dataP.value++
        }
    }
    Component.onCompleted: {
        let d=new Date()
        dataP.value=(dataP.isMonthData? (d.getMonth()+1):d.getFullYear())
    }
}
