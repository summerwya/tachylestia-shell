import Quickshell.Io

JsonObject {
    property Battery battery: Battery {}
    property Lock lock: Lock {}
    property MediaPlayer mediaPlayer: MediaPlayer {}
    property Notification notification: Notification {}
    property IdleInhibitor idleInhibitor: IdleInhibitor {}
    property Record record: Record {}

    // TODO - put this function in a separate file
    property var pick: function(a: list<string>): string {
        const selected = a.length == 1 ? a[0] : a[Math.floor(Math.random() * a.length)]
        if (selected.toLowerCase().indexOf("torena") > -1) return selected

        const roll = Math.random() // TODO - add a processor to have nested selections

        if (roll < .3) return selected
        else if (roll < .6) return "Torena-kun, " + selected
        else return selected + ", torena-kun"
    }

    component Battery: JsonObject {
        property list<string> full: ["I'm full now"]
        property list<string> calculatedTime: ["you have %1 %2"]
        property list<string> charge: ["I'm %1% right now", "I have %1% of coffee"]
        property list<string> timeLeft: ["left with me", "of coffee in me"]
        property list<string> untilFull: ["until I'm full of coffee"]
        property list<string> calculating: ["Solving...", "Calculating whatever..."]
        property list<string> noCoffee: ["I don't have any coffee", "No coffee detected, please don't unplug", "No caffeine", "No coffee"]
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
