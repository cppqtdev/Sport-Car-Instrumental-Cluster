import QtQuick 2.6
import QtQuick.Controls 2.5
ApplicationWindow {
    id:root
    width: 1280
    height: 480
    visible: true
    title: qsTr("DashBoard")
    color: "#000"
    CarLoader{
        anchors.centerIn: parent
        onLoaded: item.hidden = false
        width: parent.width / 2.5
        height: parent.height - 180
    }
}
