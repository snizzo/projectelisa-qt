import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button{

    property string inner_text;

    Text{
        color: "#5e5e5e"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: inner_text

        font.pixelSize: 25
        z: 2
    }
}
