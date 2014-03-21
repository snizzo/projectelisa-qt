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

    EUser{
        id: user
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

    Rectangle{
        id: tab_buttons_container
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        height: 50

        color: "#3399cc"

        z:4
        NavBar {
            id: tab_buttons

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            height: 50
            z:5
        }
    }

    StackView{
        id: mainView

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: tab_buttons_container.bottom

        Component.onCompleted: {
            mainView.push(Qt.createComponent("Home.qml"))
        }
    }
}

