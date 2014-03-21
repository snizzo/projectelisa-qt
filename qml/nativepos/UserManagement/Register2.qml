import QtQuick 2.0

import "../ElisaComponents"

import "../libs/libserver.js" as Server

Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 20

    Text{
        width: parent.width -40

        wrapMode: Text.WordWrap

        font.pointSize: 16

        text: "Last step involves verifying your account. This is useful to avoid spam and/or inappropriate content. Please press the button below and verify your account using Facebook."
    }

    EButton{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        text: "Verify user with facebook"

        height: 50

        onClicked: {
            console.log(nickname.text);
            //Qt.openUrlExternally("https://www.facebook.com/dialog/oauth?client_id="+fb.app_id+"&redirect_uri=http://projectelisa.altervista.org/main/fb/");
        }
    }

    Component.onCompleted: {

    }
}
