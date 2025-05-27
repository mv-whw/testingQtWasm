import QtQuick
import "../"

Canvas
{
    id: root
    required property bool isDataValid
    width: height
    readonly property bool dTheme:MyTheme.useDarkTheme

    onPaint: {
        let colCheck=root.dTheme? "green":"limegreen"
        let colError=root.dTheme? "red":"orange"
        let ctx = getContext("2d")
        ctx.reset()
        // setup the stroke
        ctx.lineWidth = 1
        ctx.strokeStyle =isDataValid? colCheck:colError
        // setup the fill
        ctx.fillStyle = isDataValid? colCheck:colError
        // begin a new path to draw
        if(isDataValid)//draw a check
        {
            ctx.beginPath()
            // top-left start point
            ctx.moveTo(0,root.height-(root.height/2))
            // left down
            ctx.lineTo(root.width/2-(root.width/5),root.height)
            // right up
            ctx.lineTo(root.width,0)
            // left down
            ctx.lineTo(root.width/2-(root.width/5),root.height-(root.height/4))
            // left line through path closing
            ctx.closePath()
            // fill using fill style
            ctx.fill()
            // stroke using line width and stroke style
            ctx.stroke()
        }else //draw x
        {
            ctx.beginPath()
            // top-left start point
            ctx.moveTo(0,0)
            //line2
            ctx.lineTo(root.width/2-(root.width/6),root.height/2)
            //line3
            ctx.lineTo(0,root.height)
            //line4
            ctx.lineTo(root.width/2,root.height/2+(root.height/6))
            //line5
            ctx.lineTo(root.width,root.height)
            //line6
            ctx.lineTo(root.width/2+(root.width/6),root.height/2)
            //line7
            ctx.lineTo(root.width,0)
            //line8
            ctx.lineTo(root.width/2,root.height/2-(root.height/6))

            // left line through path closing
            ctx.closePath()
            // fill using fill style
            ctx.fill()
            // stroke using line width and stroke style
            ctx.stroke()
        }

    }

    onIsDataValidChanged: root.requestPaint()
}
