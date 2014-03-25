import QtQuick 2.0

import "../ElisaComponents"

Column{

    anchors.left: parent.left
    anchors.right: parent.right

    spacing: 20

    ETextField{
        id: loginId
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "nickname or e-mail"
    }

    ETextField{
        id: loginPassword
        anchors.left: parent.left
        anchors.right: parent.right
        placeholderText: "password"

        echoMode: TextInput.Password
    }

    EButton{
        anchors.right: parent.right

        inner_text: "sign up"

        height: 50
        width: 150

        onClicked: {
            console.log("logging with "+loginId.text+" | "+loginPassword.text);
            server.login(loginId.text, loginPassword.text);
        }

        Component.onCompleted: {
            server.onLoginReply.connect(loginReplied);
        }

        function loginReplied(reply) {
            if(reply==="ok"){
                mainView.pop();
                mainView.current_button = "home";
                notification.show("You're now logged in.<br>Have fun :)");
            } else if (reply==="denied") {
                notification.show("Wrong username / password.<br>Please try again.");
            } else {
                notification.show("Unknown error 96");
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
