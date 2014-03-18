import QtQuick 2.0


Column {
    id: singleMessage

    width: parent.width

    Text {
        id:singleMessageBody
        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
        z:1
        text: body
        /*
        Rectangle{
            //dinamically growing background
            y: (singleMessageBody.y -5)
            height: (singleMessageOwner.height + singleMessageBody.height + 10)
            x: (singleMessageBody.x -10)
            width: (singleMessageOwner.width +10)
            color: "#F5F5F5";
            radius: 5;
            opacity: 1;
            z:-1
        }
        */
    }

    Text {
        Rectangle{
            color: "#9c9c9c"
            anchors.fill: parent
            anchors.topMargin: -3
            anchors.leftMargin: -3
            anchors.rightMargin: -3
            anchors.bottomMargin: -3
            // uncomment this when qt will be ready to handle this
            // without continuous annoying flickering
            // radius: 5
            z: -1
        }

        id:singleMessageOwner

        anchors.left: parent.left
        anchors.leftMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5

        font.pointSize: 13

        color: "#535353"
        horizontalAlignment: Text.AlignRight

        text: "written by "+owner
        z:2
    }
}
