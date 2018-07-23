import QtQuick 2.0
import Sailfish.Silica 1.0

ApplicationWindow {
    initialPage: Component {
        Page {
            id: page
            anchors.centerIn: parent
            width: parent.width

            Button {
                text: "Start Dialog"
                onClicked: pageStack.push(dialog)
                anchors.centerIn: parent
            }
        }
    }


    Dialog {
        id: dialog

        TextArea{
            width: 680
            textTopMargin: 100
            textLeftMargin: 30
            text: "Select image with double-click on it. You can hold or pinch image for zooming."
            color: "white"
        }


        Grid {
            anchors.centerIn: parent

            columns: 2
            rows: 2
            spacing: 5

            CustomImage {
                source: "pics/1.jpg"
            }

            CustomImage {
                source: "pics/2.jpg"
            }

            CustomImage {
                source: "pics/3.jpg"
            }

            CustomImage {
                source: "pics/4.jpg"
            }
        }


        onAccepted: {
            pageStack.push (page2)
        }
    }


    Page {
        id: page2

        TextArea {
            width: 400
            anchors.centerIn: parent
            text: "Select image by DoubleClick on it"
        }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Image {
            width: 400; height: 400
            id: selectedImg

            MouseArea {
                anchors.fill: parent

                state: "small"
                states:[
                    State{
                        name: "small"
                        PropertyChanges {
                            target: selectedImg
                            scale: 1.0
                        }
                    },
                    State{
                        name: "big"
                        PropertyChanges{
                            target: selectedImg
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
                pinch.target: selectedImg
                pinch.maximumScale: 1.7
            }

        }

        Button {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 15

            text: "Return to selection"
            onClicked: pageStack.pop()

        }
    }
    }

}


