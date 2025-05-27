import QtQuick
import "../"
Image {
    id: myImage
    property real realWidth: MyTheme.returnRealPropertyValue(myImage.width)
    property real realHeight: MyTheme.returnRealPropertyValue(myImage.height)
    property bool useSourceSize: false
    readonly property bool isReady: (source!=="" && myImage.status===MyImage.Ready)
    onRealHeightChanged: {
        let nh=MyTheme.returnOriginalPropertyValue(myImage.realHeight)
        if(nh!==myImage.height)
            myImage.height=nh
    }
    onHeightChanged: {
        let rH=MyTheme.returnRealPropertyValue(myImage.height)
        if(rH!==myImage.realHeight)
            myImage.realHeight=rH
        calculateSize()
    }
    onRealWidthChanged:{
        let nW=MyTheme.returnOriginalPropertyValue(myImage.realWidth)
        if(nW!==myImage.width)
            myImage.width=nW
    }

    onWidthChanged: {
        let rW=MyTheme.returnRealPropertyValue(myImage.width)
        if(rW!==myImage.realWidth)
            myImage.realWidth=rW
    }

    function calculateSize()
    {
        let sW=myImage.sourceSize.width
        let sH=myImage.sourceSize.height
        let ratio=0
        if(myImage.useSourceSize)
        {
            if(myImage.width!==sW)
                myImage.width=sW
            if(myImage.height!==sH)
                myImage.height=sH
        }else
        {
            ratio=myImage.height/sH
            let wid=Math.ceil(sW*ratio)
            if(myImage.width!==wid)
                myImage.width=wid
        }
    }

    onStatusChanged: {
        if(myImage.status===Image.Ready)
            calculateSize()
    }
}
