import Quickshell.Io

JsonObject {
    id: root

    property Battery battery: Battery {}
    property Lock lock: Lock {}
    property MediaPlayer mediaPlayer: MediaPlayer {}
    property Notification notification: Notification {}
    property IdleInhibitor idleInhibitor: IdleInhibitor {}
    property Record record: Record {}

    function track(what: string): string {
        const opening = '[', closing = ']', separator = '|';

        let actualString = [];
        let isTracking = false;
        let selection = [];
        let currentTrack = '';

        for(let c of what) {
            if (isTracking) {
                if (c === closing) {
                    selection.push(currentTrack)
                    currentTrack = ''
                    // TODO - add repeating c*3 (repeats c one to three times)
                    if (selection.length === 1) selection.push('') // Add empty item 'cuz length 1 means optional
                    actualString.push(selection[(Math.random() * selection.length) | 0])
                    isTracking = false
                } else if (c === separator) {
                    selection.push(currentTrack)
                    currentTrack = ''
                } else currentTrack += c
            } else if (c === opening) {
                isTracking = true
            } else {
                actualString.push(c)
            }
        }

        return actualString.join('')
    }

    // TODO - put this function in a separate file
    property var pick: function(a: list<string>): string {
        const selected = a.length == 1 ? a[0] : a[Math.floor(Math.random() * a.length)]
        if (selected.toLowerCase().indexOf("torena") > -1 || selected.toLowerCase().indexOf("trainer") > -1) return track(selected)

        const roll = Math.random() // TODO - add a processor to have nested selections

        if (roll < .3) return track(selected)
        else if (roll < .6) return "Torena-kun, " + track(selected)
        else return track(selected) + ", torena-kun"
    }

    component Battery: JsonObject {
        property list<string> full: ["I'm full[ now]"]
        property list<string> calculatedTime: ["you have %1 %2"]
        property list<string> charge: ["I'm %1% right now", "I have %1% of tea"]
        property list<string> timeLeft: ["left with me", "of tea in me"]
        property list<string> untilFull: ["until I'm full of tea"]
        property list<string> calculating: ["Solving...", "Calculating whatever..."]
        property list<string> noTea: ["[I don't have any|no] tea", "No tea detected, please don't unplug"]

        property list<string> plugged: ["[You p|P]lugged me in", "[Thank you for ]filling me up"]
        property list<string> unplugged: ["Ouch, trainer, be gentle", "Sigh, I guess I'll just run out of tea", "Where did the unlimited tea go?"]
        property list<string> lowTea: ["I don't have much tea left...", "Low tea..."]
        property list<string> passingOut: ["Passing out in 5 seconds...", "I don't feel too well..."]
    }

    component Lock: JsonObject {
        property list<string> inputField: ["Welcome", "How are you", "Why Torena-kun, you're here"]
        property list<string> maxPasswordAttempt: ["You've reached the max attempts", "Good luck on guessing more, stop.", "No more"]
        property list<string> maxAttempts: ["You're not my trainer, aren't you?", "You seem to have forgotten..."]
        property list<string> loading: ["Give me a sec...", "Spare me a few thousand milliseconds", "Wait.."]
    }

    component MediaPlayer: JsonObject {
        property list<string> playing: ["You're playing", "You're listening to", "You're playing"]
        property list<string> nothing: ["Nothing", "Zero-K"]
    }

    component Notification: JsonObject {
        property list<string> hasNotification: ["you have %1 notification%2"]
        property list<string> none: ["You have no notifications", "There's nothing here", "What are you looking for?"]
    }

    component IdleInhibitor: JsonObject {
        property list<string> keepAwake: ["Trying not to sleep for you~", "Not sleeping for you~"]
        property list<string> normal: ["Would you like me to stay up?", "Do you want me to stay up?"]
    }

    component Record: JsonObject {
        property list<string> paused: ["I'm not recording", "Would you like to record?"]
        property list<string> recording: ["Smile for me", "Start doing something, i'm observing", "I'm gathering data"]
        property list<string> idle: ["I'm not recording", "I'm not studying"]
    }
}
