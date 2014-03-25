import QtQuick 2.0
import QtPositioning 5.2
import QtQuick.Controls 1.1

import "ElisaComponents"
import Elisa 0.1 as Elisa

Rectangle {
    height: 762
    width: 480

    Facebook{
        id: fb
    }

    Elisa.Server{
        id: server
    }

    PositionSource {
        id: geosrc
        updateInterval: 1000
        active: true

        property string fetchUrl;
        property double latitude;
        property double longitude;
        property double f: 0.00004;

        onPositionChanged: {
            fetchUrl = "http://projectelisa.altervista.com/main/get/?x="+geosrc.position.coordinate.latitude
                    +"&y="+geosrc.position.coordinate.longitude
                    +"&z=0&f="+geosrc.f;

            latitude = geosrc.position.coordinate.latitude;
            longitude = geosrc.position.coordinate.longitude;
        }
    }

    Item{
        id: notification

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
            notification.visible = true;
        }

        MouseArea{
            anchors.fill: parent
            onClicked: {
                notification.visible = false;
            }
        }

        Component.onCompleted: {
            show("<b>Welcome to WriteItApp alpha!</b><br>You're encouraged to report bugs and post messages.");
        }
    }

    Rectangle{
        id: tab_buttons_container
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 60

        z:4
        NavBar {
            id: tab_buttons

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom

            z:5
        }
    }

    StackView{
        id: mainView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: tab_buttons_container.bottom

        property string current_button: "home"

        Component.onCompleted: {
            mainView.push(Qt.createComponent("Home.qml"))
        }
    }
}

