import qs.components
import qs.components.controls
import qs.components.misc
import qs.services
import qs.config
import QtQuick
import QtQuick.Layouts

GridLayout {
    id: root

    anchors.left: parent.left
    anchors.right: parent.right
    anchors.margins: Appearance.padding.large

    rowSpacing: Appearance.spacing.large
    columnSpacing: Appearance.spacing.large
    rows: 2
    columns: 2

    Ref {
        service: SystemUsage
    }

    StyledRect {
        Layout.fillWidth: true
        implicitHeight: width

        StyledClippingRect {
            anchors.fill: parent

            color: Colours.tPalette.m3surfaceContainer
            radius: Appearance.rounding.full

            Image {
                anchors.fill: parent
                source:  {
                            return Qt.resolvedUrl(Config.paths.tachyonImages[Math.floor(Math.random() * Config.paths.tachyonImages.length)])
                        }
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignCenter
            }
        }
    }

    StyledRect {
        Layout.fillWidth: true
        implicitHeight: width

        StyledClippingRect {
            anchors.fill: parent

            color: Colours.tPalette.m3surfaceContainer
            radius: Appearance.rounding.full

            Image {
                anchors.fill: parent
                source:  {
                            return Qt.resolvedUrl(Config.paths.tachyonImages[Math.floor(Math.random() * Config.paths.tachyonImages.length)])
                        }
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignCenter
            }
        }
    }

    StyledRect {
        Layout.fillWidth: true
        implicitHeight: width

        StyledClippingRect {
            anchors.fill: parent

            color: Colours.tPalette.m3surfaceContainer
            radius: Appearance.rounding.full

            Image {
                anchors.fill: parent
                source:  {
                            return Qt.resolvedUrl(Config.paths.tachyonImages[Math.floor(Math.random() * Config.paths.tachyonImages.length)])
                        }
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignCenter
            }
        }
    }

    StyledRect {
        Layout.fillWidth: true
        implicitHeight: width

        StyledClippingRect {
            anchors.fill: parent

            color: Colours.tPalette.m3surfaceContainer
            radius: Appearance.rounding.full

            Image {
                anchors.fill: parent
                source:  {
                            return Qt.resolvedUrl(Config.paths.tachyonImages[Math.floor(Math.random() * Config.paths.tachyonImages.length)])
                        }
                fillMode: Image.PreserveAspectFit
                Layout.alignment: Qt.AlignCenter
            }
        }
    }

    component Resource: StyledRect {
        id: res

        required property string icon
        required property real value
        required property color colour

        Layout.fillWidth: true
        implicitHeight: width

        color: Colours.layer(Colours.palette.m3surfaceContainerHigh, 2)
        radius: Appearance.rounding.large

        CircularProgress {
            id: circ

            anchors.fill: parent
            value: res.value
            padding: Appearance.padding.large * 3
            fgColour: res.colour
            bgColour: Colours.layer(Colours.palette.m3surfaceContainerHighest, 3)
            strokeWidth: width < 200 ? Appearance.padding.smaller : Appearance.padding.normal
        }

        MaterialIcon {
            id: icon

            anchors.centerIn: parent
            text: res.icon
            color: res.colour
            font.pointSize: (circ.arcRadius * 0.7) || 1
            font.weight: 600
        }

        Behavior on value {
            Anim {
                duration: Appearance.anim.durations.large
            }
        }
    }
}
