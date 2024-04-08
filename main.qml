import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.15

import "./Component"

Window {
    id:root
    width: 1920
    height: 980
    visible: true
    title: qsTr("DashBoard")

    Component.onCompleted:{
        root.showMaximized()
    }

    property alias font: font


    FontLoader
    {
        id: font
        source: "qrc:/fontawesome.otf"
    }
    Shortcut{
        sequence:"Ctrl+E"
        onActivated: {
            leftIndi.forceActiveFocus()
        }
    }

    Image{
        //visible: false
        z:-2
        sourceSize: Qt.size(root.width,root.height * 0.8)
        anchors.centerIn: parent
        source: "qrc:/Panel.png"

        //Left Side
        IconButton{
            id:leftIndicator
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left-checked/icon-park-solid_right-two.svg" : "qrc:/icons/icons-left/icon-park-solid_right-two.svg"
            anchors.right: topBar.left
            anchors.rightMargin: 40
            anchors.verticalCenter: topBar.verticalCenter
            SequentialAnimation {
                running: leftIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }
        IconButton{
            id:handbreak
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left/mdi_car-handbrake.svg" : "qrc:/icons/icons-left/mdi_car-handbrake.svg"
            anchors{
                right: leftIndicator.left
                rightMargin: 15
                verticalCenter: leftIndicator.verticalCenter
                verticalCenterOffset: 30
            }
        }
        IconButton{
            id:battery
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left-checked/mdi_car-battery.svg" : "qrc:/icons/icons-left/mdi_car-battery.svg"
            anchors{
                right: handbreak.left
                rightMargin: 15
                verticalCenter: handbreak.verticalCenter
                verticalCenterOffset: 30
            }
            SequentialAnimation {
                running: battery.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: battery.roundIcon ? battery.roundIconSource : battery.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: battery.roundIcon ? battery.roundIconSource : battery.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }
        IconButton{
            id:engineBold
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left-checked/ph_engine-bold.svg" : "qrc:/icons/icons-left/ph_engine-bold.svg"
            anchors{
                right: battery.left
                rightMargin: 10
                verticalCenter: battery.verticalCenter
                verticalCenterOffset: 35
            }
            SequentialAnimation {
                running: engineBold.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: engineBold.roundIcon ? engineBold.roundIconSource : engineBold.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: engineBold.roundIcon ? engineBold.roundIconSource : engineBold.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }
        IconButton{
            id:oil
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left-checked/mdi_oil.svg" : "qrc:/icons/icons-left/mdi_oil.svg"
            anchors{
                right: engineBold.left
                rightMargin: 10
                verticalCenter: engineBold.verticalCenter
                verticalCenterOffset: 40
            }
            SequentialAnimation {
                running: oil.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: oil.roundIcon ? oil.roundIconSource : oil.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: oil.roundIcon ? oil.roundIconSource : oil.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }
        IconButton{
            id:tireAlert
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-left/mdi_car-tire-alert.svg" : "qrc:/icons/icons-left/mdi_car-tire-alert.svg"
            anchors{
                right: oil.left
                verticalCenter: oil.verticalCenter
                verticalCenterOffset: 50
            }
        }

        Image{
            id:topBar
            source: "qrc:/Top Bar.png"
            sourceSize: Qt.size(root.width * 0.6,150)
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter


            RowLayout{
                anchors.left: parent.left
                anchors.leftMargin: 80
                anchors.verticalCenter: parent.verticalCenter
                spacing: 7
                Image{
                    source: "qrc:/icons/cloud.svg"
                    sourceSize: Qt.size(24,24)
                }
                Label{
                    text: qsTr("12 °C")
                    font.pixelSize: 24
                    font.bold: true
                    font.weight: Font.Normal
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                }
            }

            Label{
                id:timeLabel
                text: new Date().toLocaleTimeString(Qt.locale(), "hh:mm AP")
                anchors.right: parent.right
                anchors.rightMargin: 80
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: 24
                font.bold: true
                font.weight: Font.Normal
                font.family: "TacticSans-Med"
                color: "#FFFFFF"
            }
        }

        //Right Side
        IconButton{
            id:rightIndicator
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right-checked/icon-park-solid_right-two.svg" : "qrc:/icons/icons-right/icon-park-solid_right-two.svg"
            anchors.left: topBar.right
            anchors.leftMargin: 40
            anchors.verticalCenter: topBar.verticalCenter
            SequentialAnimation {
                running: rightIndicator.checked
                loops: Animation.Infinite
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 0;
                    to: 1;
                    duration: 500
                }
                OpacityAnimator {
                    target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                    from: 1;
                    to: 0;
                    duration: 500
                }
            }
        }
        IconButton{
            id:seatBreak
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_seatbelt.svg" : "qrc:/icons/icons-right/mdi_seatbelt.svg"
            anchors{
                left: rightIndicator.right
                leftMargin: 15
                verticalCenter: rightIndicator.verticalCenter
                verticalCenterOffset: 30
            }
        }
        IconButton{
            id:breakParking
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-brake-parking.svg" : "qrc:/icons/icons-right/mdi_car-brake-parking.svg"
            anchors{
                left: seatBreak.right
                leftMargin: 15
                verticalCenter: seatBreak.verticalCenter
                verticalCenterOffset: 30
            }
        }
        IconButton{
            id:lightDimmed
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-light-dimmed.svg" : "qrc:/icons/icons-right/mdi_car-light-dimmed.svg"
            anchors{
                left: breakParking.right
                leftMargin: 10
                verticalCenter: breakParking.verticalCenter
                verticalCenterOffset: 35
            }
        }
        IconButton{
            id:lightHigh
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right-checked/mdi_car-light-high.svg" : "qrc:/icons/icons-right/mdi_car-light-high.svg"
            anchors{
                left: lightDimmed.right
                leftMargin: 10
                verticalCenter: lightDimmed.verticalCenter
                verticalCenterOffset: 40
            }
        }
        IconButton{
            id:lightFog
            roundIcon: true
            iconWidth: 45
            iconHeight: 45
            checkable: true
            setIcon:checked ? "qrc:/icons/icons-right/mdi_car-light-fog.svg" : "qrc:/icons/icons-right/mdi_car-light-fog.svg"
            anchors{
                left: lightHigh.right
                verticalCenter: lightHigh.verticalCenter
                verticalCenterOffset: 50
            }
        }

        Image{
            id:leftgauge
            sourceSize: Qt.size(root.height /1.4 ,root.height /1.4)
            anchors.left: parent.left
            anchors.leftMargin: 20
            anchors.verticalCenterOffset: 50
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Tacometer.png"
            CircularGaugeMeter {
                id:leftIndi
                property bool accelerating
                anchors.centerIn: parent
                width: parent.width * 0.79
                height: parent.height * 0.79
                value: accelerating ? maximumValue : 0
                shadowVisible: true
                maximumValue: 240
                Component.onCompleted: forceActiveFocus()
                Behavior on value { NumberAnimation { duration: 1000 }}
                Keys.onSpacePressed:{
                    accelerating = true
                    rightGuage.accelerating = true
                }
                Keys.onReleased: {
                    if (event.key === Qt.Key_Space) {
                        accelerating = false;
                        event.accepted = true;
                        rightGuage.accelerating = false
                        event.accepted = true;
                    }
                }
            }

            Label{
                text: "🍃Echo"
                font.bold: true
                font.weight: Font.Normal
                font.pixelSize: 22
                font.family: "TacticSans-Med"
                color: "#2BD150"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -10
                anchors.verticalCenterOffset: parent.height * 0.1
                layer.effect: DropShadow {
                    anchors.fill: parent
                    horizontalOffset: 5
                    verticalOffset: 5
                    radius: 10
                    samples: 16
                    color: "white"
                }
            }
        }

        RowLayout{
            width: topBar.width * 0.5
            anchors.top: topBar.bottom
            anchors.horizontalCenter: topBar.horizontalCenter
            anchors.horizontalCenterOffset: 70
            Item{
                Layout.fillWidth: true
            }

            Image{
                Layout.alignment: Qt.AlignHCenter
                source: "qrc:/icons/Road/mdi_turn-right-bold.svg"
                sourceSize: Qt.size(85,85)
            }

            ColumnLayout{
                Layout.alignment: Qt.AlignHCenter
                Text{
                    font.pixelSize: 32
                    font.bold: true
                    font.weight: Font.Normal
                    font.family: "TacticSans-Blk"
                    color: "#FFFFFF"
                    text: qsTr("372 m")
                }
                Text{
                    font.pixelSize: 14
                    font.bold: true
                    font.weight: Font.Normal
                    font.family: "TacticSans-Lgt"
                    color: "#00D1FF"
                    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                    text: qsTr("Enter St. Street and \ntake first right")
                }
                Item{
                    Layout.preferredHeight: 25
                }
            }
            Item{
                Layout.fillWidth: true
            }
        }

        Image{
            source: "qrc:/icons/Road/mingcute_steering-wheel-fill.svg"
            sourceSize: Qt.size(95,95)
            anchors.top: topBar.bottom
            anchors.horizontalCenter: topBar.horizontalCenter
            anchors.horizontalCenterOffset: 230
            anchors.topMargin: 10
        }

        Image{
            source: "qrc:/icons/Road/ss.svg"
            sourceSize: Qt.size(95-20,114-20)
            scale: 0.9
            anchors.top: topBar.bottom
            anchors.horizontalCenter: topBar.horizontalCenter
            anchors.horizontalCenterOffset: -230
            anchors.topMargin: 10

            Text{
                anchors.centerIn: parent
                anchors.verticalCenterOffset: 20
                font.pixelSize: 36
                font.bold: true
                font.weight: Font.Normal
                font.family: "TacticSans-Blk"
                color: "#090C14"
                text: qsTr("90")
            }
        }

        CarLoader{
            id:roadImage
            anchors.centerIn: parent
            onLoaded: item.hidden = false
            width: parent.height * 0.66
            height: parent.height * 0.56
            anchors.verticalCenterOffset: 80
        }

        Image{
            id:roadImage2
            visible: false
            anchors.centerIn: parent
            source: "qrc:/icons/Road/road3.svg"
            anchors.verticalCenterOffset: 40
            sourceSize.height: parent.height * 0.74

            Image{
                id:mainCar
                source: "qrc:/icons/Road/car.png"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: 38
                anchors.verticalCenterOffset: 110
            }
            Image{
                sourceSize: Qt.size(mainCar.width*0.5,mainCar.height * 0.5)
                source: "qrc:/icons/Road/car.png"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -30
                anchors.verticalCenterOffset: -100
            }
        }

        RowLayout{
            width: roadImage.width * 0.6
            anchors.centerIn: parent
            anchors.verticalCenterOffset: 220

            Image{
                Layout.alignment: Qt.AlignLeft
                source: "qrc:/icons/Road/mdi_map-marker-outline.svg"
                sourceSize: Qt.size(28,28)
            }

            Label{
                Layout.alignment: Qt.AlignLeft
                font.pixelSize: 24
                font.bold: true
                font.weight: Font.Normal
                font.family: "TacticSans-Med"
                text: qsTr("26 KM")
                color: "#FFFFFF"
            }

            Item{
                Layout.fillWidth: true
            }

            Image{
                Layout.alignment: Qt.AlignRight
                source: "qrc:/icons/Road/mdi_clock-time-four-outline.svg"
                sourceSize: Qt.size(28,28)
            }

            Label{
                Layout.alignment: Qt.AlignRight
                font.pixelSize: 24
                font.bold: true
                font.weight: Font.Normal
                font.family: "TacticSans-Med"
                text: qsTr("22 Min")
                color: "#FFFFFF"
            }

        }

        Image{
            id:rightgaugae
            sourceSize: Qt.size(root.height /1.55 ,root.height /1.55)
            anchors.right: parent.right
            anchors.rightMargin: 60
            anchors.verticalCenterOffset: 50
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/Speedometer.png"
            CircularGaugeMeter {
                id:rightGuage
                anchors.centerIn: parent
                property bool accelerating
                width: parent.width * 0.85
                height: parent.height * 0.85
                value: accelerating ? maximumValue : 0
                maximumValue: 220
                shadowVisible: false
                Behavior on value { NumberAnimation { duration: 1000 }}
            }
            Label{
                text: "🍃Echo"
                font.bold: true
                font.weight: Font.Normal
                font.pixelSize: 22
                font.family: "TacticSans-Med"
                color: "#2BD150"
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -10
                anchors.verticalCenterOffset: parent.height * 0.1
                layer.effect: DropShadow {
                    anchors.fill: parent
                    horizontalOffset: 5
                    verticalOffset: 5
                    radius: 10
                    samples: 16
                    color: "white"
                }
            }
        }

        Image{
            source: "qrc:/icons/feaul.svg"
            anchors.bottom: left.top
            anchors.left: left.left
            sourceSize: Qt.size(48,48)
            anchors.bottomMargin: 5
        }

        Image{
            id:left
            source: "qrc:/icons/Vector 1.png"
            anchors.left: leftgauge.left
            anchors.bottom: leftgauge.bottom
            anchors.leftMargin: 10
            anchors.bottomMargin: 70
            layer.enabled: true
            layer.samplerName: "fuelShader"
            layer.effect: ShaderEffect {
                id: fuelShaderMask
                property variant v
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    UniformAnimator {
                        target: fuelShaderMask
                        uniform: "v"
                        from: 0
                        to: 1
                        duration: 5000
                    }
                    UniformAnimator {
                        target: fuelShaderMask
                        uniform: "v"
                        from: 1
                        to: 0
                        duration: 5000
                    }
                }

                fragmentShader: "
                     uniform lowp sampler2D fuelShader;
                     uniform lowp float qt_Opacity;
                     varying highp vec2 qt_TexCoord0;
                     uniform lowp float v;

                     void main() {
                        const lowp vec3 c1 = vec3(0.502,0.545,0.11);
                        const lowp vec3 c2 = vec3(0.247,0.78,0.871);
                        lowp vec3 bg = mix(c1, c2, 1.0 - qt_TexCoord0.y);

                        // Animated ramp
                        lowp float s = smoothstep(0.99 - v, 1.01 - v, 1.0 - qt_TexCoord0.y);
                        lowp vec3 ramp = vec3(s);
                        lowp vec4 color = vec4(bg + ramp, 1.0);

                        gl_FragColor = color * texture2D(fuelShader, qt_TexCoord0).a * qt_Opacity;
                     }
                 "
            }
        }


        Image{
            source: "qrc:/icons/desal.svg"
            anchors.bottom: right.top
            anchors.right: right.right
            sourceSize: Qt.size(48,48)
            anchors.bottomMargin: 5
        }
        Image{
            id:right
            source:  "qrc:/icons/Vector 1.png"//"qrc:/icons/Vector 2.png"
            mirror: true
            anchors.left: rightgaugae.left
            anchors.leftMargin: rightgaugae.width /2
            anchors.bottom: rightgaugae.bottom
            anchors.bottomMargin: 40
            smooth: true
            asynchronous: true
            layer.enabled: true
            layer.samplerName: "fuelShader"
            layer.effect: ShaderEffect {
                id: fuelShaderMask2
                property variant v
                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    UniformAnimator {
                        target: fuelShaderMask2
                        uniform: "v"
                        from: 0
                        to: 1
                        duration: 5000
                    }
                    UniformAnimator {
                        target: fuelShaderMask2
                        uniform: "v"
                        from: 1
                        to: 0
                        duration: 5000
                    }
                }

                fragmentShader: "
                     uniform lowp sampler2D fuelShader;
                     uniform lowp float qt_Opacity;
                     varying highp vec2 qt_TexCoord0;
                     uniform lowp float v;

                     void main() {
                        const lowp vec3 c1 = vec3(0.502,0.545,0.11);
                        const lowp vec3 c2 = vec3(0.247,0.78,0.871);
                        lowp vec3 bg = mix(c1, c2, 1.0 - qt_TexCoord0.y);

                        // Animated ramp
                        lowp float s = smoothstep(0.99 - v, 1.01 - v, 1.0 - qt_TexCoord0.y);
                        lowp vec3 ramp = vec3(s);
                        lowp vec4 color = vec4(bg + ramp, 1.0);

                        gl_FragColor = color * texture2D(fuelShader, qt_TexCoord0).a * qt_Opacity;
                     }
                 "
            }
        }

        Image{
            sourceSize: Qt.size(topBar.width,topBar.height)
            source: "qrc:/icons/bottom.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom

            RowLayout{
                spacing: 60
                anchors.right: middle.left
                anchors.rightMargin: 60
                anchors.verticalCenter: middle.verticalCenter
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf3c5"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.family: font.name
                    font.pixelSize: 32
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }

                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf601"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }
            }

            RowLayout{
                id:middle
                anchors.centerIn: parent

                Text{
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 45
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                    text: rightGuage.value.toFixed(0)
                }

                Text{
                    Layout.alignment: Qt.AlignVCenter
                    font.pixelSize: 24
                    color: "#FFFFFF"
                    font.family: "TacticSans-Med"
                    text: "Km/hr"
                }
            }

            RowLayout{
                spacing: 60
                anchors.left: middle.right
                anchors.leftMargin: 60
                anchors.verticalCenter: middle.verticalCenter
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    text: "\uf001"
                    onCheckedChanged: {
                        if(checked){

                        }
                    }
                }
                IconButton{
                    setIconSize:32
                    implicitHeight: 45
                    implicitWidth: 45
                    checkable: true
                    font.bold: Font.DemiBold
                    font.weight: Font.Normal
                    font.pixelSize: 32
                    font.family: font.name
                    iconBackground: "transparent"
                    setIconColor :checked ? "#777781" : "#777781"
                    text: "\uf1de"
                }
            }
        }
    }
}
