import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

//custom elisa
import "ElisaComponents"

Item {
    property int totalitems
    totalitems: 2

    Button {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: parent.width * (1/totalitems)

        onClicked: {
            mainView.push(Qt.createComponent("Home.qml"), {replace:true})
        }

        Text {
            id: messages_text
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "MESSAGES"
            style: Text.Raised;
            color: "white"
        }
        style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#555" : "#000"
                }
        }
    }

    Button{
        id: info_button
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: parent.width * (1/totalitems)

        onClicked: {
            mainView.push(Qt.createComponent("Info.qml"), {replace:true})
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "INFO"
            style: Text.Raised
            color: "white"
        }

        style: ButtonStyle {
                background: Rectangle {
                    color: control.pressed ? "#555" : "#000"
                }
        }

    }
}
