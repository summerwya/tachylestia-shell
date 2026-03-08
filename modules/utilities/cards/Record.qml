pragma ComponentBehavior: Bound

import qs.components
import qs.components.controls
import qs.services
import qs.config
import QtQuick
import QtQuick.Layouts

StyledRect {
    id: root

    required property var props
    required property var visibilities

    Layout.fillWidth: true
    implicitHeight: layout.implicitHeight + layout.anchors.margins * 2

    radius: Appearance.rounding.normal
    color: Colours.tPalette.m3surfaceContainer

    ColumnLayout {
        id: layout

        anchors.fill: parent
        anchors.margins: Appearance.padding.large
        spacing: Appearance.spacing.normal

        RowLayout {
            spacing: Appearance.spacing.normal
            z: 1

            StyledClippingRect {
                implicitWidth: implicitHeight
                implicitHeight: Appearance.padding.larger * 4

                radius: Appearance.rounding.full
                color: Recorder.running ? Colours.palette.m3secondary : Colours.palette.m3secondaryContainer

                Image {
                    id: icon

                    anchors.fill: parent
                    anchors.centerIn: parent
                    scale: 1.5
                    fillMode: Image.PreserveAspectFit
                    source: Qt.resolvedUrl("root:/assets/yapper.png")
                }
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 0

                StyledText {
                    Layout.fillWidth: true
                    text: qsTr("Tachy Cam")
                    font.pointSize: Appearance.font.size.normal
                    elide: Text.ElideRight
                }

                StyledText {
                    Layout.fillWidth: true
                    text: Recorder.paused ? qsTr(Config.dialogues.pick(Config.dialogues.record.paused)) : Recorder.running ? qsTr(Config.dialogues.pick(Config.dialogues.record.recording)) : qsTr(Config.dialogues.pick(Config.dialogues.record.idle))
                    color: Colours.palette.m3onSurfaceVariant
                    font.pointSize: Appearance.font.size.small
                    elide: Text.ElideRight
                }
            }

            SplitButton {
                disabled: Recorder.running
                active: menuItems.find(m => root.props.recordingMode === m.icon + m.text) ?? menuItems[0]
                menu.onItemSelected: item => root.props.recordingMode = item.icon + item.text

                menuItems: [
                    MenuItem {
                        icon: "fullscreen"
                        text: qsTr("Record everything")
                        activeText: qsTr("Everything")
                        onClicked: Recorder.start()
                    },
                    MenuItem {
                        icon: "screenshot_region"
                        text: qsTr("Record specific area")
                        activeText: qsTr("Region")
                        onClicked: Recorder.start(["-r"])
                    },
                    MenuItem {
                        icon: "select_to_speak"
                        text: qsTr("Everything with sound")
                        activeText: qsTr("Fullscreen")
                        onClicked: Recorder.start(["-s"])
                    },
                    MenuItem {
                        icon: "volume_up"
                        text: qsTr("Specific area with sound")
                        activeText: qsTr("Region")
                        onClicked: Recorder.start(["-sr"])
                    }
                ]
            }
        }

        Loader {
            id: listOrControls

            property bool running: Recorder.running

            Layout.fillWidth: true
            Layout.preferredHeight: implicitHeight
            sourceComponent: running ? recordingControls : recordingList

            Behavior on Layout.preferredHeight {
                id: locHeightAnim

                enabled: false

                Anim {}
            }

            Behavior on running {
                SequentialAnimation {
                    ParallelAnimation {
                        Anim {
                            target: listOrControls
                            property: "scale"
                            to: 0.7
                            duration: Appearance.anim.durations.small
                            easing.bezierCurve: Appearance.anim.curves.standardAccel
                        }
                        Anim {
                            target: listOrControls
                            property: "opacity"
                            to: 0
                            duration: Appearance.anim.durations.small
                            easing.bezierCurve: Appearance.anim.curves.standardAccel
                        }
                    }
                    PropertyAction {
                        target: locHeightAnim
                        property: "enabled"
                        value: true
                    }
                    PropertyAction {}
                    PropertyAction {
                        target: locHeightAnim
                        property: "enabled"
                        value: false
                    }
                    ParallelAnimation {
                        Anim {
                            target: listOrControls
                            property: "scale"
                            to: 1
                            duration: Appearance.anim.durations.small
                            easing.bezierCurve: Appearance.anim.curves.standardDecel
                        }
                        Anim {
                            target: listOrControls
                            property: "opacity"
                            to: 1
                            duration: Appearance.anim.durations.small
                            easing.bezierCurve: Appearance.anim.curves.standardDecel
                        }
                    }
                }
            }
        }
    }

    Component {
        id: recordingList

        RecordingList {
            props: root.props
            visibilities: root.visibilities
        }
    }

    Component {
        id: recordingControls

        RowLayout {
            spacing: Appearance.spacing.normal

            StyledRect {
                radius: Appearance.rounding.full
                color: Recorder.paused ? Colours.palette.m3tertiary : Colours.palette.m3error

                implicitWidth: recText.implicitWidth + Appearance.padding.normal * 2
                implicitHeight: recText.implicitHeight + Appearance.padding.smaller * 2

                StyledText {
                    id: recText

                    anchors.centerIn: parent
                    animate: true
                    text: Recorder.paused ? "PAUSED" : "REC"
                    color: Recorder.paused ? Colours.palette.m3onTertiary : Colours.palette.m3onError
                    font.family: Appearance.font.family.mono
                }

                Behavior on implicitWidth {
                    Anim {}
                }

                SequentialAnimation on opacity {
                    running: !Recorder.paused
                    alwaysRunToEnd: true
                    loops: Animation.Infinite

                    Anim {
                        from: 1
                        to: 0
                        duration: Appearance.anim.durations.large
                        easing.bezierCurve: Appearance.anim.curves.emphasizedAccel
                    }
                    Anim {
                        from: 0
                        to: 1
                        duration: Appearance.anim.durations.extraLarge
                        easing.bezierCurve: Appearance.anim.curves.emphasizedDecel
                    }
                }
            }

            StyledText {
                text: {
                    const elapsed = Recorder.elapsed;

                    const hours = Math.floor(elapsed / 3600);
                    const mins = Math.floor((elapsed % 3600) / 60);
                    const secs = Math.floor(elapsed % 60).toString().padStart(2, "0");

                    let time;
                    if (hours > 0)
                        time = `${hours}:${mins.toString().padStart(2, "0")}:${secs}`;
                    else
                        time = `${mins}:${secs}`;

                    return qsTr("Recording for %1").arg(time);
                }
                font.pointSize: Appearance.font.size.normal
            }

            Item {
                Layout.fillWidth: true
            }

            IconButton {
                label.animate: true
                icon: Recorder.paused ? "play_arrow" : "pause"
                toggle: true
                checked: Recorder.paused
                type: IconButton.Tonal
                font.pointSize: Appearance.font.size.large
                onClicked: {
                    Recorder.togglePause();
                    internalChecked = Recorder.paused;
                }
            }

            IconButton {
                icon: "stop"
                inactiveColour: Colours.palette.m3error
                inactiveOnColour: Colours.palette.m3onError
                font.pointSize: Appearance.font.size.large
                onClicked: Recorder.stop()
            }
        }
    }
}
