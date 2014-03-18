import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

//custom elisa
import "ElisaComponents"

Item {
    property int totalitems
    totalitems: 2

    EButton {
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        width: parent.width * (1/totalitems) -10

        onClicked: {
            mainView.push(Qt.createComponent("Home.qml"), {replace:true})
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "MESSAGES"
            style: Text.Raised;
            color: "#5e5e5e"

        }
    }

    Button{
        id: info_button
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5

        width: parent.width * (1/totalitems) -10

        onClicked: {
            mainView.push(Qt.createComponent("Info.qml"), {replace:true})
        }

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "INFO"
            style: Text.Raised
            color: "#5e5e5e"
        }

        style: ButtonStyle {
                background: Rectangle {
                    border.width: 0
                    radius: 5
                    color: control.pressed ? "#ccc" : "#eee"
                }
            }

    }
}
