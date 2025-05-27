import QtQuick
import "../KolendarComponents"
import "../"
MyDialog {
    realWidth: myKolView.realWidth+20
    property int selectedDay: MyTheme.dateHelper.getCurrentDate()
    property int selectedMonth: MyTheme.dateHelper.getCurrentMonth()
    property int selectedYear: MyTheme.dateHelper.getCurrentYear()
    property alias selectionRule: myKolView.selectionRule
    isCancelVisible: true

    signal selectionChanged(date:int, month:int, year:int)

    KolendarView{
        id: myKolView

        monthData: parent.selectedMonth
        yearData: parent.selectedYear
    }


    onClickedOn: (index)=>{
                     if(index===0)
                     {
                         let isChange=false
                         if(selectedDay!==myKolView.dateData)
                         {
                             isChange=true
                             selectedDay=myKolView.dateData
                         }
                         if(selectedMonth!==myKolView.monthData)
                         {
                             isChange=true
                             selectedMonth=myKolView.monthData
                         }
                         if(selectedYear!==myKolView.yearData)
                         {
                             isChange=true
                             selectedYear=myKolView.yearData
                         }
                         if(isChange)
                            selectionChanged(selectedDay,selectedMonth,selectedYear)
                     }

                     close()
                 }
}
