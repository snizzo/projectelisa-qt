import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

import "ElisaComponents"

Item{
    id: homepage

    anchors.top: parent.top
    anchors.topMargin: 5

    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5

    EBoxBackground{
        target:parent
    }

    Slider {
        id: slider

        Rectangle {
            id: rectSlider
            y: slider.y-5
            height: slider.height + 10
            x: slider.x-30
            width: slider.width + refreshButton.width + 40
            color: "#f5f5f5"
            z: -1
        }

        anchors.top: refreshButton.top
        anchors.left: parent.left
        anchors.leftMargin: 15
        anchors.right: refreshButton.left
        anchors.rightMargin: 15
        anchors.bottom: refreshButton.bottom

        maximumValue: 0.0010
        //minimumValue: 0.0015
        minimumValue: 0.00001
        stepSize: 0.00001

        updateValueWhileDragging: false
        
        z: 2

        onValueChanged: {
            messageModel.reload();
        }
    }

    Binding {
        target: geosrc
        property: 'f'
        value: slider.value
    }

    Button{
        id: refreshButton

        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 5
        height: childrenRect.height + 20
        width: childrenRect.width + 20
        z: 2

        onClicked: {
            messageModel.reload();
        }

        Text{
            color: "#5e5e5e"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Refresh"

            font.pixelSize: 25
            z: 2
        }
    }

    XmlListModel {
        id: messageModel
        query: "/rss/messages/message"

        XmlRole { name: "id"; query: "id/string()" }
        XmlRole { name: "x"; query: "x/string()" }
        XmlRole { name: "y"; query: "y/string()" }
        XmlRole { name: "z"; query: "z/string()" }
        XmlRole { name: "body"; query: "body/string()" }
        XmlRole { name: "votesup"; query: "up/number()" }
        XmlRole { name: "votesdown"; query: "down/number()" }
        XmlRole { name: "owner"; query: "owner/string()" }
    }

    Binding {
        target: messageModel
        property: 'source'
        value: geosrc.fetchUrl
    }

    ListView{
        id: messageView
        anchors.top: refreshButton.bottom
        anchors.topMargin: 12
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: message_textedit.top
        anchors.bottomMargin: 16

        model: messageModel

        spacing: 20

        delegate: MessageDelegate{ }

        BusyIndicator {
            id:viewIndicator
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            visible: true
            width: 100
            height: 100
            states: [
                State {
                    name: "loading"
                    when: messageModel.status == XmlListModel.Loading

                    PropertyChanges {
                        target: viewIndicator
                        visible: true
                    }
                },
                State {
                    name: "hidden"
                    when: messageModel.status == XmlListModel.Ready

                    PropertyChanges {
                        target: viewIndicator
                        visible: false
                    }
                }
            ]
        }
    }

    ETextField {
        id: message_textedit
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        anchors.right: sendButton.left


        style: TextFieldStyle {
            textColor: "black"
            background: Rectangle {
                color: "#dddddd"
                radius: 5
                implicitHeight: 60
            }
        }
        onAccepted: {
            if (message_textedit.text !== "") {
                sendButton.sendMessage(message_textedit.text);
                message_textedit.text = ""
            }
        }
        z: 2
    }

    Rectangle {
        id: bottomRect

        y: message_textedit.y - 5
        height: message_textedit.height + 30
        width: message_textedit.width + sendButton.width + 15
        color: "#f5f5f5"
        z: 0
    }

    Button{
        id: sendButton
        anchors.top: message_textedit.top
        
        anchors.right: parent.right
        anchors.rightMargin: 5

        width: childrenRect.width + 10
        height: message_textedit.height

        states:[
            State {
                name: "normal"
                PropertyChanges { target: sendButtonValue; state: "normal" }
            },
            State {
                name: "acting"
                PropertyChanges { target: sendButtonValue; state: "acting" }
            }
        ]

        Text {
            id:sendButtonValue
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "Send"
            color: "#5e5e5e"

            states:[
                State {
                    name: "normal"
                    PropertyChanges { target: sendButtonValue; text: "Send" }
                    PropertyChanges { target: sendButtonValue; color: "#5e5e5e" }
                    PropertyChanges { target: sendButtonValue; enabled: true }
                },
                State {
                    name: "acting"
                    PropertyChanges { target: sendButtonValue; text: "Sending..." }
                    PropertyChanges { target: sendButtonValue; color: "#b1b1b1" }
                    PropertyChanges { target: sendButtonValue; enabled: false }
                }
            ]
        }

        function sendMessage(body)
        {   
            //setting button acting
            sendButton.state = "acting"

            var http = new XMLHttpRequest();
            var latitude = geosrc.latitude;
            var longitude = geosrc.longitude;

            server.addMessage(body, latitude, longitude);
        }

        function sendMessageReplied(reply)
        {
            sendButton.state = "normal";

            if(reply==="ok"){
                notification.show("Message inserted!");
                message_textedit.text = "";
            } else if (reply==="denied") {
                notification.show("You need to be logged in to post!");
            } else {
                notification.show("Unknown error!");
            }
        }

        onClicked: {
            if (message_textedit.text !== "") {
                sendMessage(message_textedit.text);
            }
        }

        Component.onCompleted: {
            server.onAddMessageReply.connect(sendMessageReplied);
        }
    }
}
