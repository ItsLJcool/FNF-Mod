//zad
function create() {
    defaultCamZoom = 0.5;
	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/Rat/rat2'));
	bg.updateHitbox();
    bg.screenCenter();
	bg.antialiasing = true;
    bg.scale.set(1.8,1.8);
    bg.scrollFactor.set(1,1);
	add(bg);
    bg.alpha = 0.001;
    dad.alpha = 0.001;
    boyfriend.alpha = 0.001;

    boyfriend.setPosition(boyfriend.x+250,boyfriend.y-100);
    gf.visible = false;
    dad.setPosition(dad.x-300,dad.y-100);
}

function createPost() {
	flashScreen = new FlxSprite(-400, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFFFFFFFF);
    flashScreen.screenCenter();
    flashScreen.alpha = 0;
    add(flashScreen);
}

function stepHit(curStep){
    switch(curStep){
        case 128:
            FlxTween.tween(dad, {alpha: 0.6},  1);
        case 192:
            FlxTween.tween(boyfriend, {alpha: 0.6},  1);
        case 576:
            defaultCamZoom = 0.6;
            flashScreen.alpha = 1;
            FlxTween.tween(flashScreen, {alpha: 0.001},  1);
            bg.alpha = 1;
            dad.alpha = 1;
            boyfriend.alpha = 1;
    }
}
