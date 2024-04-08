import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Extras 1.4

Item {
    id: root
    width: 1280
    height: 480
    property alias car: car
    property bool startupAnimationStopped: false
    property int gaugeDemoTime: 1000
    property alias centerStack: centerStack // duration (/2) of the gauge needle animation at startup

    property color iconRed: "#e41e25"
    property color iconGreen: "#5caa15"
    property color iconYellow: "#face20"
    property color iconDark: "#444444"

    // TODO: Needed, as background clearing gets messed up after hybrid 3D
    Rectangle {
        anchors.fill: parent
        color: "black"
        z: -1
    }
    // comment ifndef QT_3DCORE_LIB
    CarLoader {
        id: car

        width: parent.width / 2.5
        height: parent.height - 180

        anchors.centerIn: parent
    }
    Item {
        id: container

        width: root.width
        height: root.height
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.centerIn: parent

        CenterStack {
            id: centerStack
            viewIndex: 3
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 83
        }
    }
    // end comment
}
