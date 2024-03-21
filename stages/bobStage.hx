//a
import flixel.math.FlxMath;

var stage:Stage = null;
var originalCamZoom = 1;
var originalCamFollowLerp = 1;
function create() {
	stage = loadStage('bobStage');
	originalCamZoom = defaultCamZoom;
	originalCamFollowLerp = camFollowLerp;
	
	
	defaultCamZoom = FlxG.camera.zoom = 0.8;
	PlayState.camHUD.alpha = 0.0001;
	
}
var startIntro:Bool = false;
function update(elapsed) {
	stage.update(elapsed);

	if (!startIntro) {
		PlayState.camFollow.y = -650;
		PlayState.camFollow.x = 550;
	} 

	if (PlayState.section == null) {
        FlxG.camera.focusOn(PlayState.camFollow.getPosition());
	}
}
function beatHit(curBeat) {
	stage.onBeat();

	switch(curBeat) {
		case 7:
			startIntro = true;
			camFollowLerp = 0.004;
			FlxTween.num(defaultCamZoom, originalCamZoom, 7, {ease: FlxEase.quadInOut, onComplete: function() {
				defaultCamZoom = originalCamZoom;
				camFollowLerp = originalCamFollowLerp;
			},onUpdate: function(twn) {
			}}, function(v:Float) {
				defaultCamZoom = FlxG.camera.zoom = v;
			});
		case 22:
			FlxTween.num(PlayState.camHUD.alpha, 1, 3, {ease: FlxEase.quadInOut}, function(v:Float) {
				PlayState.camHUD.alpha = v;
			});
	}
}

function onCountdown(val) {
	return false;
}