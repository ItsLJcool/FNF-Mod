//a

var logo:FlxSprite;

var myReaction:FlxSprite;
function create() {

    myReaction = new FlxSprite(0,0, Paths.image("myHonestReaction"));
    myReaction.setGraphicSize(FlxG.width, FlxG.height);
    myReaction.screenCenter();
    myReaction.alpha = 0.0001;
    add(myReaction);
    FlxTween.tween(myReaction, {alpha: 0.8}, 1800);

    logo = new FlxSprite();
    logo.frames = Paths.getSparrowAtlas("logoFUCKING");
    logo.animation.addByPrefix("idle", "logobumpin0", 14, false);
    logo.animation.play("idle", true);
    logo.screenCenter();
    logo.scale.set(3,3);
    logo.y -= 50;
    add(logo);

    
}

function beatHit(curBeat) {
    logo.animation.play("idle", true);
}