import QtQuick 2.0

import "../ElisaComponents"


Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 20

    Text{
        width: parent.width -40

        wrapMode: Text.WordWrap

        font.pointSize: 16

        text: "Login or sign up to post messages!"
    }

    EButton{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        text: "I already have an account"

        height: 50

        onClicked: {
            logView.push(Qt.createComponent("Login.qml"));
        }
    }

    EButton{
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10

        text: "Register an account"

        height: 50

        onClicked: {
            logView.push(Qt.createComponent("Register.qml"));
        }
    }
}
