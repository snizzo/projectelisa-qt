import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Button{
    style: ButtonStyle {
        background: Rectangle {
            border.width: 0
            radius: 5
            color: control.pressed ? "#ccc" : "#eee"
        }
    }
    
}
