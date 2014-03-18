import QtQuick 2.0

Rectangle {
    property Item target;
    y: (target.y - 10)
    height: (target.height + 20)
    x: (target.x - 10)
    width: (target.width + 20)
    color: "#F5F5F5";
    radius: 5;
    opacity: 1;
}
