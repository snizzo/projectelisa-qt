import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

//custom components imports
import "ElisaComponents"

Item{
    anchors.top: parent.top
    anchors.topMargin: 10

    anchors.bottom: parent.bottom
    anchors.bottomMargin: 30

    EBoxBackground{
        target:infopage
    }


    Column{
        id: infopage
        anchors.fill: parent


        spacing: 20

        ETitle{
            id: accountTitle

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 30


            text: "Account"
        }

        Button{
            anchors.left: parent.left
            anchors.leftMargin: 10
            anchors.right: parent.right
            anchors.rightMargin: 10

            text: "Sign up"


            style: ButtonStyle {
                background: Rectangle {
                    border.width: 0
                    radius: 5
                    color: control.pressed ? "#ccc" : "#eee"
                }
            }

            onClicked: {
                Qt.openUrlExternally("https://www.facebook.com/dialog/oauth?client_id="+fb.app_id+"&redirect_uri=http://projectelisa.altervista.org/main/fb/");
            }
        }

        ESeparator{}

        ETitle{
            id: gpsTitle

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 30


            text: "Positioning"
        }

        Row{
            id: latitudeRow

            property double latitude;

            Text{
                text: "Latitude:\t"
            }
            Text{
                text: parent.latitude
            }
        }

        Row{
            id: longitudeRow

            property double longitude;

            Text{
                text: "Longitude:\t"
            }
            Text{
                text: parent.longitude
            }
        }

        Binding {
            target: latitudeRow
            property: 'latitude'
            value: geosrc.latitude
        }

        Binding {
            target: longitudeRow
            property: 'longitude'
            value: geosrc.longitude
        }

        ESeparator{}
    }

}
