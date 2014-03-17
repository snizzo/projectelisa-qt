import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Item{
    id: homepage

    Slider {
        id: slider
        maximumValue: 0.0015
        minimumValue: 0.00001
        stepSize: 0.00001
        anchors.left: parent.left
        anchors.right: refreshButton.left
        anchors.leftMargin: 10
        anchors.rightMargin: 12
        updateValueWhileDragging: false
        y: 10
        z: 1
        onValueChanged: {
            messageModel.reload();
        }
    }

    Binding {
        target: geosrc
        property: 'f'
        value: slider.value
    }

    Image{
        id: refreshButton
        source: "images/Refresh-icon.png";
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.rightMargin: 4
        height: 71
        width: 71
        z: 1
        MouseArea {
            anchors.fill: parent
            onClicked: {
                messageModel.reload();
            }
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
        XmlRole { name: "owner"; query: "owner/string()" }
    }

    Binding {
        target: messageModel
        property: 'source'
        value: geosrc.fetchUrl
    }

    ListView{
        anchors.top: refreshButton.bottom
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.bottom: message_textedit.top

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

    Rectangle{
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.rightMargin: 5
        anchors.right: parent.right

        color: "#c8c8c8"

        height:60
    }

    TextField {
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
    }

    Button{
        id: sendButton
        anchors.top: message_textedit.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5

        width: childrenRect.width + 10

        Text {
            id:sendButtonValue
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
            text: "send"
            color: "#5e5e5e"

        }

        style: ButtonStyle {
            background: Rectangle {
                border.width: 0
                radius: 5
                color: control.pressed ? "#ccc" : "#eee"
            }
        }

        function sendMessage(body)
        {
            var http = new XMLHttpRequest();
            var latitude = geosrc.latitude;
            var longitude = geosrc.longitude;
            var url = "http://projectelisa.host56.com/main/post/?x="+latitude+"&y="+longitude+"&z=0&owner=000000"
            var params = "body="+body;
            http.open("POST", url, true);

            // Send the proper header information along with the request
            http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            http.setRequestHeader("Content-length", params.length);
            http.setRequestHeader("Connection", "close");

            http.onreadystatechange = function() { // Call a function when the state changes.
                        if (http.readyState == 4) {
                            if (http.status == 200) {
                                console.log("ok")
                            } else {
                                console.log("error: " + http.status)
                            }
                        }
                    }
            http.send(params);
        }

        onClicked: {
            sendMessage(message_textedit.text);
        }

        Keys.onReturnPressed: {
            sendMessage(message_textedit.text);
        }
    }
}
