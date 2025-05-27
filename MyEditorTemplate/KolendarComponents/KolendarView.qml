import QtQuick
import "../BasicComponents"
import "../"
MyColumn {
    realSpacing: 4
    realWidth: koleDayView.useSmallValues? 230:280

    property alias yearData: yearP.dataValue
    property alias monthData: monthP.dataValue
    property alias dateData: koleDayView.selectedDate
    property alias selectionRule: koleDayView.selectionRule
    property int selectedM: MyTheme.dateHelper.getCurrentMonth()
    property int selectedY: MyTheme.dateHelper.getCurrentYear()

    onYearDataChanged: koleDayView.changeLayout()
    onMonthDataChanged: koleDayView.changeLayout()


    ControlPanel{
        id: yearP
        isMonthDataPanel: false
    }
    ControlPanel{
        id: monthP
        isMonthDataPanel: true
        onOverflow: (isBackOverflow)=>{
                        if(isBackOverflow)
                            yearP.dataValue--
                        else
                            yearP.dataValue++
                    }
    }
    KolendarDayViews{
        id: koleDayView
        property int selectionRule: 0

        onSelectionRuleChanged: {
            //koleDayView.changeClickableDays()
        }

        function changeClickableDays(): void
        {
            if(koleDayView.selectionRule===0)
            {
                for(let k=13;k<44;k++)
                    if(!koleDayView.children[k].canBeSelected)
                        koleDayView.children[k].canBeSelected=true
                return
            }
            let m=MyTheme.dateHelper.getCurrentMonth()
            let d=MyTheme.dateHelper.getCurrentDate()
            let y=MyTheme.dateHelper.getCurrentYear()
            if(koleDayView.selectionRule<0)
            {

            }
            if(koleDayView.selectionRule>0)
            {
                if(yearData>y)
                {
                    for(let k=13;k<44;k++)
                        if(!koleDayView.children[k].canBeSelected)
                            koleDayView.children[k].canBeSelected=true
                }else
                {
                    if(yearData<y)
                    {
                        for(let k=13;k<44;k++)
                            if(koleDayView.children[k].canBeSelected)
                                koleDayView.children[k].canBeSelected=false
                    }else
                    {
                        if(monthData>m)
                        {
                            for(let k=13;k<44;k++)
                                if(!koleDayView.children[k].canBeSelected)
                                    koleDayView.children[k].canBeSelected=true
                        }
                        else
                        {
                            if(monthData<m)
                            {
                                for(let k=13;k<44;k++)
                                    if(koleDayView.children[k].canBeSelected)
                                        koleDayView.children[k].canBeSelected=false
                            }
                            else
                            {
                                for(let k=13;k<44;k++)
                                    koleDayView.children[k].canBeSelected=(koleDayView.children[k].dayValue<d? false:true)
                            }
                        }
                    }
                }
            }
        }

        function changeLayout(): void
        {
            let startOn=MyTheme.dateHelper.monthStartOn(parent.monthData-1, parent.yearData)
            for(let i=0;i<6;i++)
            {
                if(startOn===0)
                    koleDayView.children[(7+i)].visible=true
                else
                    koleDayView.children[(7+i)].visible=(i<(startOn-1))? true:false
            }
            let daysVisibleOfset=MyTheme.dateHelper.getNumberDaysInMonth(parent.monthData-1,parent.yearData)-28
            for(let j=0;j<3;j++)
                koleDayView.children[(41+j)].visible= (daysVisibleOfset>j)
            changeClickableDays()
        }
    }
}
