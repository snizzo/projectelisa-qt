import QtQuick 2.0
import QtQuick.Controls 1.1

Column{
    id: infopage

    spacing: 20

    Button{
        anchors.left: parent.left
        anchors.right: parent.right

        text: "Login with facebook"

        onClicked: {
            Qt.openUrlExternally("https://www.facebook.com/dialog/oauth?client_id="+fb.app_id+"&redirect_uri=http://projectelisa.host56.com/main/fb/");
        }
    }


    Text{
        id: accountInfo

        anchors.left: parent.left
        anchors.leftMargin: 15;

        property string email;

        font.pointSize: 20

        text: "Logged in as " + email;
    }


    //Binding {
    //    target: accountInfo
    //    property: 'email'
    //    value:
    //}

    Text{
        id: gpsInfo

        anchors.left: parent.left
        anchors.leftMargin: 20;

        font.pointSize: 18

        property double latitude;
        property double longitude;

        text: "Latitude: " + latitude + "\nLongitude: " + longitude;
        color: "white"


        Rectangle{
            anchors.fill: parent
            color: "#000066";
            radius: 5;
            opacity: 1;
            anchors.topMargin: -6
            anchors.leftMargin: -6
            anchors.rightMargin: -6
            anchors.bottomMargin: -6
            border.color: "black"
            border.width: 2
            z: -1;
        }
    }

    Binding {
        target: gpsInfo
        property: 'latitude'
        value: geosrc.latitude
    }

    Binding {
        target: gpsInfo
        property: 'longitude'
        value: geosrc.longitude
    }
}
