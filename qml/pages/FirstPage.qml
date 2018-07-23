import QtQuick 2.0
import Sailfish.Silica 1.0
import Sailfish.Pickers 1.0

Page {
    id: page
    anchors.centerIn: parent
    width: parent.width

    Button {
        text: "Start Dialog"
        onClicked: pageStack.push(imagePickerPage)
        anchors.centerIn: parent
    }

    Image {
      id: selectedImage
      sourceSize.height: Theme.itemSizeHuge
    }
    Component {
        id: imagePickerPage
        ImagePickerPage {
            onSelectedContentPropertiesChanged: {
              selectedImage.source = selectedContentProperties.filePath
                pageStack.push(Qt.resolvedUrl("SecondPage.qml"), {imgPath: selectedImage.source})
            }
        }
    }
 }




