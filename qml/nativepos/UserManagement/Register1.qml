import QtQuick 2.0

import "../ElisaComponents"

Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 10


    Text{
        anchors.left: parent.left
        anchors.right: parent.right
        text: "Nickname:"
    }

    TextInput{
        id: nickname
        anchors.left: parent.left
        anchors.right: parent.right
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: -10
            anchors.bottomMargin: -10
            anchors.leftMargin: -5
            anchors.rightMargin: -5
            color: "#dddddd"
            radius: 5
            implicitHeight: 60
            z: -1
        }
    }


    Text{
        anchors.left: parent.left
        anchors.right: parent.right
        text: "Password:"
    }
    TextInput{
        id: password
        anchors.left: parent.left
        anchors.right: parent.right
        echoMode: TextInput.Password
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: -10
            anchors.bottomMargin: -10
            anchors.leftMargin: -5
            anchors.rightMargin: -5
            color: "#dddddd"
            radius: 5
            implicitHeight: 60
            z: -1
        }
    }

    Text{
        anchors.left: parent.left
        anchors.right: parent.right
        text: "Repeat password:"
    }
    TextInput{
        id: passwordRepeat
        anchors.left: parent.left
        anchors.right: parent.right
        echoMode: TextInput.Password
        Rectangle {
            anchors.fill: parent
            anchors.topMargin: -10
            anchors.bottomMargin: -10
            anchors.leftMargin: -5
            anchors.rightMargin: -5
            color: "#dddddd"
            radius: 5
            implicitHeight: 60
            z: -1
        }
    }

    Row{
        anchors.left: parent.left
        anchors.right: parent.right

        height: 50
        /*
        EButton{
            anchors.left: parent.left

            inner_text: "back"

            height: 50
            width: 150

            onClicked: {
                logView.pop();
            }
        }
        */

        EButton{
            anchors.right: parent.right

            inner_text: "next"

            height: 50
            width: 150

            onClicked: {
                var n1 = nickname.text;
                var p1 = password.text;
                var p2 = passwordRepeat.text;
                var m1 = facebookMail.text;

                if(p1 != p2){
                    console.log("passwords don't match");
                }

                server.registerUser(n1,p1,m1);
            }

            Component.onCompleted: {
                server.onRegisterUserReply.connect(registerUserReplied);
            }

            function registerUserReplied(reply) {
                if(reply==="ok"){
                    logView.push(Qt.createComponent("Register2.qml"));
                } else if (reply==="mailexists") {
                    notification.show("Mail already registered!");
                } else if (reply==="nicknameexists") {
                    notification.show("Nickname already registered!");
                }
            }
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
