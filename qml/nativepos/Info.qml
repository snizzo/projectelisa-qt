import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

//custom components imports
import "ElisaComponents"

Item{
    id: info
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

        StackView{
            id: logView

            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.right: parent.right
            anchors.rightMargin: 20

            height: childrenRect.height

            Component.onCompleted: {
                if(user.logged === false){
                    logView.push(Qt.createComponent("UserManagement/NotLogged.qml"));
                } else {
                    logView.push(Qt.createComponent("UserManagement/Logged.qml"));
                }
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

            anchors.left: parent.left
            anchors.leftMargin: 20

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

            anchors.left: parent.left
            anchors.leftMargin: 20

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
