import QtQuick 2.0

Row{
    anchors.left: parent.left
    anchors.leftMargin: 20

    property double latitude;

    Text{
        text: "Username:\t"
    }
    Text{
        text: server.nickname
    }
}
