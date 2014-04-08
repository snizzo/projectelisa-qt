import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import QtGraphicalEffects 1.0

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

        text: " " + owner
        z:3

        Rectangle {
            anchors.fill: parent
            color: "#ccc"
            radius: 5
            z: -1
        }

        Rectangle{
            id: rectBorder
            y: (singleMessageOwner.y -5)
            height: (singleMessageOwner.height + singleMessageBody.height + 84)
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
            anchors.rightMargin: 20
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            verticalAlignment: Text.AlignVCenter
            color: "black"
            z:4

            Component.onCompleted: {
                var vdown = votesdown;
                if(vdown===0){
                    vdown = 0.00001;
                }

                if(vdown!==0){
                    var rate = ((votesup/vdown)-1)*255;

                    if(rate>255){
                        rate = 255;
                    }

                    var rate_abs = Math.abs(rate);
                    var difference = (votesup-votesdown);

                    var hex = Math.ceil(rate_abs).toString(16);

                    console.log(hex);

                    if(difference>=0){
                        text = "+"+difference.toString();
                        color = "#00"+hex+"00";
                    } else {
                        text = difference.toString();
                        color = "#"+hex+"0000";
                    }

                } else {
                    text = "0";
                }
            }

            /*
            Rectangle{
                color: "#00ff66"
                anchors.fill: parent
                radius: 5
                z: -1
            }
            */
        }
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

        font.pointSize: 15
        wrapMode: Text.WordWrap
    }

    Rectangle{
        anchors.left: parent.left
        anchors.right: parent.right
        height: 2
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

            onClicked: {
                server.report(id);
                notification.show("A report has been submitted to our servers. We'll evaluate it as soon as possible.");
            }
        }

        Button {
            id: up
            width: 60
            height: 50

            Image {
                id: upImage
                source: "images/up.png"
                anchors.fill: parent
            }

            onClicked: {
                server.voteUp(id);
                notification.show("Your vote has been registered!");
            }
        }

        Button {
            id: down
            width: 60
            height: 50

            Image {
                id: downImage
                source: "images/down.png"
                anchors.fill: parent
            }
            onClicked: {
                server.voteDown(id);
                notification.show("Your vote has been registered!");
            }
        }
        z: 3
    }
}
