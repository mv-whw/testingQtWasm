import QtQuick

QtObject {
    id: calHelper

    function isLeapYear(year:int): bool
    {
        if(year%4===0)
        {
            if(year%100!==0)
                return true
            else
            {
                if(year%400===0)
                    return true
                else
                    return false
            }
        }else
            return false
    }

    function getCurrentDate(): int
    {
        return new Date().getDate()
    }

    function getCurrentMonth(): int
    {
        return (new Date().getMonth()+1)
    }
    function getCurrentYear(): int
    {
        return new Date().getFullYear()
    }

    function getNumberDaysInMonth(month: int, year: int): int //zero based month
    {
        let n=0
        switch(month)
        {
        case 1:
            n= (isLeapYear(year)? 29:28)
            break
        case 0: case 2: case 4: case 6: case 7: case 9: case 11:
            n=31
            break
        case 3: case 5: case 8: case 10:
            n=30
            break
        }
        return n
    }

    function getDifferenceBetweenTwoDates(date1: Date, date2:Date): Date
    {
        return (date1-date2)
    }

    function monthStartOn(month: int, year:int): int //return 0 based
    {
        let newDate=new Date(year,month,1)
        return newDate.getDay()
    }
}
