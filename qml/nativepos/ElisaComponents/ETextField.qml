import QtQuick 2.0
import QtQuick.XmlListModel 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

TextField {
    
    inputMethodHints: Qt.ImhNoPredictiveText

    style: TextFieldStyle {
        textColor: "black"
        background: Rectangle {
            color: "#dddddd"
            radius: 5
            implicitHeight: 60
        }
    }
}
