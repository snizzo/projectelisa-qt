import QtQuick 2.0

import "../ElisaComponents"

Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 20

    ETextField{
        id: facebookMail
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "facebook e-mail"
    }

    ETextField{
        id: facebookMailRepeat
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "repeat e-mail"
    }

    EButton{
        anchors.right: parent.right

        inner_text: "sign up"

        height: 50
        width: 150

        onClicked: {
            logView.push(Qt.createComponent("Register1.qml"));
        }
    }

    /*
    EButton{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        text: "Verify user with facebook"

        height: 50

        onClicked: {
            Qt.openUrlExternally("https://www.facebook.com/dialog/oauth?client_id="+fb.app_id+"&redirect_uri=http://projectelisa.altervista.org/main/fb/");
        }
    }
    */
}
