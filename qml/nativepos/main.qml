import QtQuick 2.0
import QtPositioning 5.2
import QtQuick.Controls 1.1

Rectangle {
    height: 762
    width: 480

    //main bg color
    color: "#c8c8c8"

    Facebook{
        id: fb
    }

    PositionSource {
        id: geosrc
        updateInterval: 5000
        active: true

        property string fetchUrl;
        property double latitude;
        property double longitude;
        property double f: 0.00004;

        onPositionChanged: {
            fetchUrl = "http://projectelisa.host56.com/main/get/?x="+geosrc.position.coordinate.latitude
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

        color: "#c8c8c8"

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
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.top: tab_buttons_container.bottom
        anchors.topMargin: 10


        Component.onCompleted: {
            mainView.push(Qt.createComponent("Home.qml"))
        }
    }
}
