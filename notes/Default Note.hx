function create() {
    super.create();
}

var animNames:Array<String> = [
    "singLEFT", "singLEFT-alt",
    "singDOWN", "singDOWN-alt",
    "singUP", "singUP-alt",
    "singRIGHT", "singRIGHT-alt",
    "idle", "idle-alt"
];
var missAnimNames:Array<String> = [
    "singLEFTmiss",
    "singDOWNmiss",
    "singUPmiss",
    "singRIGHTmiss",
    "idle", "idle-alt"
];
function onPlayerHit(note:Int) {
    for (char in PlayState.boyfriends) {
        for (anim in animNames) {
            if (char.animation.curAnim.name != anim) continue;
            // This checks if the anim name Is NOT currently the anim, why? its called the Guard Clause.
            super.onPlayerHit(note);
        }
    }
}

// you can remove this function if you want your animations to stop when missing a note
function onMiss(note:Int) {
    for (char in PlayState.boyfriends) {
        for (anim in missAnimNames) {
            if (char.animation.curAnim.name != anim) continue;
            super.onMiss(note);
        }
    }
}

function onDadHit(oof:Int) {
    for (char in PlayState.dads) {
        for (anim in animNames) {
            if (char.animation.curAnim.name != anim) continue;
            super.onDadHit(oof);
        }
    }
}