import QtQuick 2.0

Image{

    width: 320; height: 330
    id: img
    fillMode: Image.PreserveAspectFit
    property alias source: img.source
    MouseArea {
        anchors.fill: parent

        state: "small"
        states:[
            State{
                name: "small"
                PropertyChanges {
                    target: img
                    scale: 1.0
                }
            },
            State{
                name: "big"
                PropertyChanges{
                    target: img
                    scale: 2.2
                    y:170; x:162
                    z:1
                }
            }
        ]
        onDoubleClicked: {
            selectedImg.source = img.source
            dialog.accept()
        }
        onPressAndHold : {
            state = "big"
        }
        onReleased: {
            state = "small"
        }
    }
    PinchArea {
        pinch.target: img
        pinch.maximumScale: 2.0
    }




}
