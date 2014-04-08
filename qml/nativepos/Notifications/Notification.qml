import QtQuick 2.0
import "../ElisaComponents"

Item{
    id : me
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: parent.bottom

    z:5
    Rectangle{

        anchors.fill: parent

        color: "#000000"

        opacity: 0.7

        z:1
    }

    EBoxBackground{
        target: notificationText
        opacity: 1
        z:2
    }

    Text{
        id:notificationText

        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        wrapMode: Text.WordWrap

        opacity: 1

        width: parent.width -100

        font.pointSize: 13

        text: ""
        z:3
    }

    function show(s){
        notificationText.text = s + "<br><br>(tap to hide)";
        me.visible = true;
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            me.visible = false;
        }
    }
}
