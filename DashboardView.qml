import QtQuick 2.4

DashboardForm {
    id: main

    width: 1280
    height: 480
    //Start animating gauges after both are loaded
    function showGauges() {
        if (speedoMeter.status === Loader.Ready
                && flipable.rpm.status === Loader.Ready) {
        }
    }

    property var component: [
        "qrc:/DashboardForm.qml",
    ]

    property string mapPositionImage: "image://etc/MapLocationSport.png"

    property int videoviewindex: 3
    property int parkingviewindex: 4
    property int carviewindex: 5

    property int preReversingCenterView: -1
    property int preReversingRightView

    // CarModel animations
    property int carModelHighlightType: 0

    property bool doorAction: false
    property bool actionInProgress: false
    property bool loadingInProgress: false
    property bool isReversing: false

    property int doorsOpen: 2
    property bool flatTire: true
    property bool lightFailure:true
    property int gear: 4

    property var cameraView
    property bool viewChanged: true

    function forceCarView() {
        actionInProgress = true
        // Make CarView visible before activating the animations
        if (car.item && car.item.hidden) {
            if (camera.visible)
                camera.visible = false
            car.opacity = 1.0
            centerStack.visible = false
            car.visible = true
            car.item.hidden = false
        }
    }

    function loadCenterView(nextView, allowParking) {
        loadingInProgress = true
        var previousViewIndex = centerStack.viewIndex

        if (preReversingCenterView != -1 && !allowParking) {
            if (centerStack.viewIndex !== preReversingCenterView) {
                centerStack.viewIndex = preReversingCenterView
                if (centerStack.viewIndex < 0)
                    centerStack.viewIndex = 5
            }
        }
        else {
            centerStack.viewIndex = getViewIndex(centerStack.viewIndex, nextView, allowParking)
        }
        loadingInProgress = false

        if (previousViewIndex === carviewindex)
            centerStack.fadeOutCenter.target = car
        else if (previousViewIndex === videoviewindex)
            centerStack.fadeOutCenter.target = camera
        else
            centerStack.fadeOutCenter.target = centerStack.loader
        centerStack.fadeOutCenter.start()
    }

    function getViewIndex(viewindex, nextView, allowParking) {
        if (allowParking) {
            return videoviewindex
        }

        if (nextView) {
            viewindex++
            if (viewindex === parkingviewindex) {
                viewindex++
            }
            if (viewindex > 5)
                viewindex = 0
        } else {
            viewindex--
            if (viewindex === parkingviewindex) {
                viewindex--
            }
            if (viewindex < 0)
                viewindex = 5
        }
        return viewindex
    }

    onDoorsOpenChanged: {
        if (actionInProgress && !doorAction)
            return

        // Check all doors & parse a correct value from them
        var doors = 0
        if (ValueSource.frontLeftOpen)
            doors ^= 1
        if (ValueSource.frontRightOpen)
            doors ^= 2
        if (ValueSource.trunkOpen)
            doors ^= 4
        if (ValueSource.hoodOpen)
            doors ^= 8

        if (doors != 0) {
            forceCarView()
            if (car.item)
                car.item.highlightDoors(doors)
            carModelHighlightType = -1
        }
    }

    onFlatTireChanged: {
        if (!actionInProgress && flatTire) {
            forceCarView()
            carModelHighlightType = car.item.highlightTire()
        }
    }

    onLightFailureChanged: {
        if (!actionInProgress && lightFailure) {
            forceCarView()
            carModelHighlightType = car.item.highlightLamp()
        }
    }

    onGearChanged: {
        if (gear === -1)
            reversing()
        else if (gear >= 0)
            returnFromReversing()
    }

    onViewChangedChanged: changeView(viewChanged)

    function reversing() {
        isReversing = true
        // Car backing up, trigger rear camera view and proximity sensor view
        preReversingCenterView = centerStack.viewIndex
        loadCenterView(0, true)
        flipable.flipped = !flipable.flipped
    }

    function returnFromReversing() {
        if (!isReversing)
            return
        loadCenterView(true, false)
        preReversingCenterView = -1
        flipable.flipped = !flipable.flipped
        isReversing = false
    }

    function changeView(nextView) {
        if (isReversing)
            return
        if (actionInProgress || loadingInProgress)
            return
        if (nextView)
            loadCenterView(nextView)
    }
    Timer {
        id: returnView
        interval: 1000
        running: false
        onTriggered: {
            if (camera.x === centerStack.x)
                camera.visible = true
            car.item.hidden = true
            car.visible = false
            car.opacity = 0.0
            centerStack.visible = true
        }
    }
}
