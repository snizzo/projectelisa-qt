import QtQuick 2.0

import "../ElisaComponents"

Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 20

    ETextField{
        id: nickname
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "nickname"
    }

    ETextField{
        id: password
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "password"
    }

    ETextField{
        id: passwordRepeat
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "repeat password"
    }

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
            var m2 = facebookMailRepeat.text;

            if(p1 != p2){
                console.out("passwords don't match");
            }

            if(m1 != m2){
                console.out("mails don't match");
            }

            Qt.openUrlExternally("http://projectelisa.altervista.org/main/register/?nick="+n1+"&pass="+p1+"&mail="+m1);

            logView.push(Qt.createComponent("Register2.qml"));
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
