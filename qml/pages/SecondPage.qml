import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0

Page {
    id: page2
    property string imgPath

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            width: 400; height: 400
            id: img
            source: imgPath
            fillMode: Image.PreserveAspectFit

            transform: Scale {
                        id: tform
                        origin.x: img.width/2
                        origin.y: img.height/2

                    }

            MouseArea {
                anchors.fill: parent
                property real pressedX: img.x
                property real pressedY: img.y
                onPressed:  {
                    pressedX = mouse.x
                    pressedY = mouse.y
                }                       
                onPositionChanged:  {
                    if (mouse.y < pressedY){
                        tform.xScale += 0.03
                        tform.yScale += 0.03
                    }
                    if (mouse.y > pressedY){
                        tform.xScale -= 0.03
                        tform.yScale -= 0.03
                    }
                }
            }
        }       
    }
}
