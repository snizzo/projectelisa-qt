import QtQuick 2.0
import QtPositioning 5.2
import QtQuick.Controls 1.1

import "ElisaComponents"
import Elisa 0.1 as Elisa

import "Tutorial"
import "Notifications"

Rectangle {
    height: 762
    width: 480

    //facebook handler
    //actually contains just appid
    Facebook{
        id: fb
    }

    //handles communication between server and client
    //plus configs
    Elisa.Server{
        id: server
    }

    Elisa.Options{
        id: options
    }

    //used for first time tutorial
    Tutorial{
        id: tutorial
        z:10

        Component.onCompleted: {
            if(options.firstrun){
                //showing tutorial
                start();
                //setting firstrun has already been executed
                //TODO: change this to false!!
                options.firstrun = false;
            }
        }
    }

    //provides gps updates
    PositionSource {
        id: geosrc
        updateInterval: 5000
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


    Notification{
        id: notification

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

