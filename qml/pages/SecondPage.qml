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
                            scale: 1.7
                            z:1
                        }
                    }
                ]
                onPressAndHold : {
                    state = "big"
                }
                onReleased: {
                    state = "small"
                }
            }
            PinchArea {
                pinch.target: img
                pinch.maximumScale: 1.7
            }

        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Return to selection"
            onClicked: pageStack.pop()
        }
    }
}

