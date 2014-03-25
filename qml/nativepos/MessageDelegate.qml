import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Column {
    id: singleMessage
    width: parent.width
    spacing: 4

    Text {
        id: singleMessageOwner

        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5

        height: 50

        color: "black"
        verticalAlignment: Text.AlignVCenter
        font {italic: true;}

        text: " written by " + owner
        z:3

        Rectangle{
            id: rectBorder
            y: (singleMessageOwner.y -5)
            height: (singleMessageOwner.height + singleMessageBody.height + 94)
            x: (singleMessageOwner.x -10)
            width: (singleMessageBody.width +10)
            border.color: "black"
            border.width: 2
            radius: 5;
            z: -2
        }

        Text {
            id: messageVote
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            text: " +23 "
            color: "black"
            z:4

            Rectangle{
                color: "#00ff66"
                anchors.fill: parent
                radius: 5
                z: -1
            }
        }
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        color: "black"
        z: 5
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
    }

    Text {
        id: singleMessageBody
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        z:3
        text: body

        wrapMode: Text.WordWrap
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
        color: "black"
        z: 5
    }

    Row {
        id: row
        anchors.right: parent.right
        anchors.rightMargin: 8
        spacing: 8

        Button {
            width: 100
            height: 50
            Text{
                color: "#5e5e5e"
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Report"

                font.pixelSize: 25
                z: 2
            }
        }

        Button {
            id: up
            width: 60
            height: 50

            style: ButtonStyle {
                background: Rectangle {
                    anchors.fill: parent
                    color: "#00ff66"
                    radius: 5
                }
            }

            Image {
                id: upImage
                source: "images/up.png"
                anchors.fill: parent
            }
        }

        Button {
            id: down
            width: 60
            height: 50
            style: ButtonStyle {
                background: Rectangle {
                    anchors.fill: parent
                    color: "red"
                    radius: 5
                }
            }

            Image {
                id: downImage
                source: "images/down.png"
                anchors.fill: parent
            }

        }
        z: 3
    }
}
