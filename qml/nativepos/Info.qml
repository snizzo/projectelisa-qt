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
            Qt.openUrlExternally("https://www.facebook.com/dialog/oauth?client_id=629813533764728&redirect_uri=http://projectelisa.altervista.org/main/fb/&scope=email");
        }
    }

    Text{
        id: gpsInfo

        property double latitude;
        property double longitude;

        text: latitude + " | " + longitude;
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
