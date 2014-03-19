import QtQuick 2.0
import QtQuick.Controls 1.1

Column {
    id: singleMessage

    width: parent.width

    spacing: 8

    Text {
        id:singleMessageBody
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        z:1
        text: body

        Rectangle{
            //dinamically growing background
            y: (singleMessageBody.y -5)
            height: (singleMessageOwner.height + singleMessageBody.height + 18)
            x: (singleMessageBody.x -10)
            width: (singleMessageOwner.width +10)
            border.color: "black"
            border.width: 2
            radius: 5;
            opacity: 1;
            z: -1
        }
    }

    Text {
        Rectangle{
            color: "#3399cc"
            anchors.fill: parent
            anchors.leftMargin: -2
            anchors.rightMargin: -2
            anchors.bottomMargin: -2
            anchors.topMargin: -2
            radius: 5
            z: -1
        }

        id:singleMessageOwner

        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5

        height: 50
        font.pointSize: 13

        color: "#535353"
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignBottom

        text: "written by "+owner
        z:2

        Button {
            id: up
            anchors.right: down.left
            anchors.rightMargin: 8
            anchors.bottom: parent.bottom
            width: 50
            height: 50
        }

        Button {
            id: down
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: 50
            height: 50
        }
    }
}
