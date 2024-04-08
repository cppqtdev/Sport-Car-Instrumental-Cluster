import QtQuick 2.6

Item {
    id: centerStack
    property int viewIndex: 4
    height: root.height - 173
    width: root.width / 2
    clip: true

    property alias fadeOutCenter: fadeOutCenter
    property alias fadeInCenter: fadeInCenter
    property alias loader: loader


    Loader {
        id: loader
        onStatusChanged: {
            if (status == Loader.Ready)
                fadeInCenter.start()
        }
        anchors.fill: parent
    }

    PropertyAnimation {
        id: fadeInCenter
        target: loader
        property: "opacity"
        from: 0.0
        to: 1.0
        duration: 400
        easing.type: Easing.Linear
    }

    PropertyAnimation {
        id: fadeOutCenter
        property: "opacity"
        from: 1.0
        to: 0.0
        duration: 250
        easing.type: Easing.Linear
        onStopped: {
            if (target === car) {
                car.visible = false
                car.item.hidden = true
            }
            if (centerStack.viewIndex === carviewindex) {
                car.visible = true
                fadeInCenter.target = car
                car.item.hidden = false
                fadeInCenter.start()
            }else {
                fadeInCenter.target = loader
            }
            loader.source = component[centerStack.viewIndex]
        }
    }
}
