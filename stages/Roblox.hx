//zad
function create() {
    autoCamZooming = false;
    defaultCamZoom = 0.5;
	bg = new FlxSprite(0, 0).loadGraphic(Paths.image('stages/Rat/rat2'));
	bg.updateHitbox();
    bg.screenCenter();
    bg.setPosition(bg.x,bg.y+50);
	bg.antialiasing = true;
    bg.scale.set(1.8,1.8);
    bg.scrollFactor.set(1,1);
	add(bg);
    
    spacy = new FlxBackdrop(Paths.image('stages/Rat/spacy'));
    spacy.velocity.set(-10, 0);
    spacy.screenCenter();
    spacy.scrollFactor.set();
    spacy.scale.set(1.8,1.8);
    spacy.alpha = 0.2;
    add(spacy);

    bg.alpha = 0.001;
    gf.alpha = 0.001;
    dad.alpha = 0.001;
    boyfriend.alpha = 0.001;
    gf.scrollFactor.set(1,1);

    boyfriend.setPosition(boyfriend.x+250,boyfriend.y-100);
    gf.setPosition(400, 20);
    dad.setPosition(dad.x-300,dad.y-100);
}

function createPost() {
	spacyScreen = new FlxSprite(-400, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFF6a60b3);
    spacyScreen.screenCenter();
    spacyScreen.alpha = 0.7;
    spacyScreen.blend = 9;
    spacyScreen.scrollFactor.set(0.9,0.9);
    add(spacyScreen);

	flashScreen = new FlxSprite(-400, -400).makeGraphic(Std.int(FlxG.width * 5), Std.int(FlxG.height * 5), 0xFFFFFFFF);
    flashScreen.screenCenter();
    flashScreen.alpha = 0.001;
    add(flashScreen);
    var rand = FlxG.random.int(1, 2);
    
    jumpscare = new FlxSprite(-300, -200).loadGraphic(Paths.image('stages/Rat/jumpscare' + rand));
    jumpscare.antialiasing = EngineSettings.antialiasing;
    switch(rand){
        case 2:
            jumpscare.scale.set(3, 3);
        case 1:
            jumpscare.scale.set(5, 3.5);
    }
    jumpscare.screenCenter();
    jumpscare.scrollFactor.set();
    jumpscare.alpha = 0.001;
    jumpscare.blend = 5;
    add(jumpscare); 

    camHUD.alpha = 0.001;
}

function stepHit(curStep){
    switch(curStep){
        case 0:
            for (i in playerStrums) {
                FlxTween.tween(i, {alpha: 0}, 1);
            }
            
        case 128:
            FlxTween.tween(camHUD, {alpha: 0.6},  1);
            FlxTween.tween(dad, {alpha: 0.6},  1);
        case 192:
            FlxTween.tween(boyfriend, {alpha: 0.6},  1);
            for (i in playerStrums) {
                FlxTween.tween(i, {alpha: 1}, 1);
            }
        case 564:
            autoCamZooming = false;
            autoCamPos = false;
            camFollow.setPosition(gf.x,gf.y);
            FlxTween.tween(gf, {alpha: 1},  1);
            gf.screenCenter();
            gf.scrollFactor.set();
            FlxTween.tween(camGame, {zoom: 1},  1);
        case 576:
            FlxTween.tween(spacyScreen, {alpha: 0.001},  1);
            FlxTween.tween(spacy, {alpha: 0.001},  1);
            gf.scrollFactor.set(1,1);
            gf.setPosition(400, 20);
            autoCamZooming = true;
            autoCamPos = true;
            FlxTween.tween(camHUD, {alpha: 1},  1);
            defaultCamZoom = 0.6;
            flashScreen.alpha = 1;
            FlxTween.tween(flashScreen, {alpha: 0.001},  1);
            jumpscare.alpha = 1;
            FlxTween.tween(jumpscare, {alpha: 0.001},  1);
            bg.alpha = 1;
            dad.alpha = 1;
            boyfriend.alpha = 1;
        case 592, 624,656,688:
            defaultCamZoom = 0.7;
        case 608, 640,672:
            defaultCamZoom = 0.6;
        case 704:
            defaultCamZoom = 0.8;
            autoCamPos = false;
        case 708:
            autoCamPos = true;
            defaultCamZoom = 0.6;
    }
}
