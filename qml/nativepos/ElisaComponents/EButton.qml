import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button{

    property string inner_text;

    style: ButtonStyle {
        background: Rectangle {
            border.width: 0
            radius: 5
            color: control.pressed ? "#ccc" : "#eee"
        }
    }

    Text {
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 25
        text: inner_text
        color: "#5e5e5e"
    }
    
}
