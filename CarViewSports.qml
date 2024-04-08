import QtQuick 2.0
import QtQuick.Scene3D 2.0

Item {
    id: mainview
    visible: true
    width: root.width / 3
    height: root.height
    property alias hidden: carModel.hidden

    Scene3D {
        id: carScene
        width: mainview.width
        height: mainview.height
        multisample: true

        CarModelSports {
            id: carModel
            scene: carScene
        }
    }

    // Functions to control highlights from dashboard
    function highlightLamp() {
        var type = carModel.highlightLamp()
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
        return type
    }

    function highlightDoors(doors) {
        doorAction = true
        carModel.doorAction = true
        carModel.highlightOpenDoors(doors)
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
    }

    function highlightTire() {
        var type = carModel.highlightTire()
        carModel.toggleIdleTimer(true)
        resetModelTimer.restart()
        return type
    }

    Timer {
        id: resetModelTimer
        interval: 3000
        running: false
        onTriggered: {
            carModel.resetHighlight()
            carModelHighlightType = 0
            doorAction = false
            actionInProgress = false
            if (!centerStack.visible) // return previous view if we forced the car model
                returnView.start()
            if (visible)
                carModel.toggleIdleTimer(true)
        }
    }

    onVisibleChanged: {
        // Start/stop idle timer, that will trigger camera rotation around the car model after X secs
        carModel.toggleIdleTimer(visible)
    }

    // TODO: Don't use if car view is not the first one
    Component.onCompleted: {
        // Start/stop idle timer, that will trigger camera rotation around the car model after X secs
        carModel.toggleIdleTimer(visible)
    }
}
