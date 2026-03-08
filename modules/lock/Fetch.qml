pragma ComponentBehavior: Bound

import qs.components
import qs.services
import qs.config
import qs.utils
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

ColumnLayout {
    id: root

    anchors.fill: parent
    anchors.margins: Appearance.padding.large * 2

    RowLayout {
        Layout.fillWidth: true
        Layout.fillHeight: true

        StyledRect {
            implicitWidth: prompt.implicitWidth + Appearance.padding.normal * 2
            implicitHeight: prompt.implicitHeight + Appearance.padding.normal * 2

            color: Colours.palette.m3primary
            radius: Appearance.rounding.small

            MonoText {
                id: prompt

                anchors.centerIn: parent
                text: "Agnes Tachyon"
                font.pointSize: root.width > 400 ? Appearance.font.size.larger : Appearance.font.size.normal
                color: Colours.palette.m3onPrimary
            }
        }

        MonoText {
            Layout.fillWidth: true
            text: "Umamusume"
            font.pointSize: root.width > 400 ? Appearance.font.size.larger : Appearance.font.size.normal
            elide: Text.ElideRight
        }
    }

    RowLayout {

        ColumnLayout {

            StyledRect {
                Layout.fillWidth: true
                implicitHeight: width
                Layout.topMargin: parent.height * .05
                Layout.bottomMargin: parent.height * .05

                StyledClippingRect {
                    anchors.fill: parent

                    color: Colours.tPalette.m3surfaceContainer
                    radius: Appearance.rounding.normal

                    Image {
                        anchors.fill: parent
                        source:   {
                            return Qt.resolvedUrl(Config.paths.tachyonImages[Math.floor(Math.random() * Config.paths.tachyonImages.length)])
                        }
                        fillMode: Image.PreserveAspectFit
                        Layout.alignment: Qt.AlignCenter
                    }
                }
            }

            FetchText {
                text: `Torena-kun : ${SysInfo.user}`
            }

            FetchText {
                text: `Awake for  : ${SysInfo.uptime}`
            }

            WrappedLoader {
                id: batLoader

                Layout.fillWidth: true
                active: UPower.displayDevice.isLaptopBattery

                sourceComponent: FetchText {
                    text: `Coffee Left: ${[UPowerDeviceState.Charging, UPowerDeviceState.FullyCharged, UPowerDeviceState.PendingCharge].includes(UPower.displayDevice.state) ? "(+) " : ""}${Math.round(UPower.displayDevice.percentage * 100)}%`
                }
            }
        }
    }

    component WrappedLoader: Loader {
        visible: active
    }

    component FetchText: MonoText {
        Layout.fillWidth: true
        font.pointSize: root.width > 400 ? Appearance.font.size.larger : Appearance.font.size.normal
        elide: Text.ElideMiddle
    }

    component MonoText: StyledText {
        font.family: Appearance.font.family.mono
    }
}
