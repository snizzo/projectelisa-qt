import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

//custom elisa
import "ElisaComponents"

Item {
    property int totalitems
    totalitems: 2

    Button {
        id: messages_button
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: parent.width * (1/totalitems)

        onClicked: {
            if (mainView.current_button == "info") {
                mainView.push(Qt.createComponent("Home.qml"), {replace:true})
                mainView.current_button = "home";
            }
        }

        Rectangle {
            id: messages_rectangle
            anchors.fill: parent
            Text {
                id: messages_text
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 25
                text: "MESSAGES"
                style: Text.Raised
            }
            states: [
                State {
                    name: "m1"
                    when: mainView.current_button == "home"

                    PropertyChanges {
                        target: messages_rectangle
                        color: "#f5f5f5"
                    }
                    PropertyChanges {
                        target: messages_text
                        color: "black"
                    }
                },
                State {
                    name: "m2"
                    when: mainView.current_button == "info"

                    PropertyChanges {
                        target: messages_rectangle
                        color: "black"
                        //color: control.pressed ? "#555" : "#000"
                    }
                    PropertyChanges {
                        target: messages_text
                        color: "white"
                    }
                }
            ]
        }
    }

    Button{
        id: info_button
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        width: parent.width * (1/totalitems)

        onClicked: {
            if (mainView.current_button == "home") {
                mainView.push(Qt.createComponent("Info.qml"), {replace:true})
                mainView.current_button = "info";
            }
        }

        Rectangle {
            id: info_rectangle
            anchors.fill: parent
            Text {
                id: info_text
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 25
                text: "INFO"
                style: Text.Raised
            }
            states: [
                State {
                    name: "i1"
                    when: mainView.current_button == "home"

                    PropertyChanges {
                        target: info_rectangle
                        color: "black"
                        //color: control.pressed ? "#555" : "#000"
                    }
                    PropertyChanges {
                        target: info_text
                        color: "white"
                    }
                },
                State {
                    name: "i2"
                    when: mainView.current_button == "info"

                    PropertyChanges {
                        target: info_rectangle
                        color: "#f5f5f5"
                    }
                    PropertyChanges {
                        target: info_text
                        color: "black"
                    }
                }
            ]
        }
    }
}
