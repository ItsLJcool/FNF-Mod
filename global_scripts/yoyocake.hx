//a

function create() {
    PlayState.isWidescreen = false;
}

function beatHit(curBeat) {
	if (canBop) FlxG.camera.zoom += bopAmount;
}

var canBop:Bool = false;
var bopAmount:Float = 0;

function cameraBop(amount:String, bop:String) {
	switch (bop.toLowerCase()) {
		case "true": bop = true;
		default: bop = false;
	}
	canBop = bop;
	autoCamZooming = !bop;
	if (amount == null)
		return;
	bopAmount = Std.parseFloat(amount / 2);
}

function angleAmount(amount:String) {
	angleAmount = Std.parseFloat(amount);
}

// stealing my own code !!
var camHUDangle:Bool = false;
var angleAmount:Int = 1.25;

function updatePost(elapsed:Float) {
	if (PlayState.section == null)
		return;
	var singer = (PlayState.section.mustHitSection) ? PlayState.boyfriend : PlayState.dad;
	switch (singer.animation.name) {
		default:
			PlayState.camGame.angle = FlxMath.lerp(PlayState.camGame.angle, 0, elapsed * 4);
			if (camHUDangle)
				PlayState.camHUD.angle = FlxMath.lerp(PlayState.camHUD.angle, 0, elapsed * 4);
		case "singLEFT", "singLEFT-alt":
			PlayState.camGame.angle = FlxMath.lerp(PlayState.camGame.angle, angleAmount, elapsed * 2);
			if (camHUDangle)
				PlayState.camHUD.angle = FlxMath.lerp(PlayState.camHUD.angle, -angleAmount * 2, elapsed * 2);
		case "singDOWN", "singDOWN-alt":
			PlayState.camGame.angle = FlxMath.lerp(PlayState.camGame.angle, angleAmount, elapsed * 2);
			if (camHUDangle)
				PlayState.camHUD.angle = FlxMath.lerp(PlayState.camHUD.angle, -angleAmount * 2, elapsed * 2);
		case "singUP", "singUP-alt":
			PlayState.camGame.angle = FlxMath.lerp(PlayState.camGame.angle, -angleAmount, elapsed * 2);
			if (camHUDangle)
				PlayState.camHUD.angle = FlxMath.lerp(PlayState.camHUD.angle, angleAmount * 2, elapsed * 2);
		case "singRIGHT", "singRIGHT-alt":
			PlayState.camGame.angle = FlxMath.lerp(PlayState.camGame.angle, -angleAmount, elapsed * 2);
			if (camHUDangle)
				PlayState.camHUD.angle = FlxMath.lerp(PlayState.camHUD.angle, angleAmount * 2, elapsed * 2);
	}
	moveCamera();
}

var moveCam = 45;
function moveCamera() {
	if (PlayState.section == null || PlayState.dad.curCharacter == "Friday Night Funkin':unknown")
		return;
	var animName = "";
	if (PlayState.section.mustHitSection)
		animName = PlayState.boyfriend.animation.curAnim.name;
	else
		animName = PlayState.dad.animation.curAnim.name;
	switch (animName) {
		case "singLEFT", "singLEFT-alt":
			PlayState.camFollow.x -= moveCam;
		case "singRIGHT", "singRIGHT-alt":
			PlayState.camFollow.x += moveCam;
		case "singUP", "singUP-alt":
			PlayState.camFollow.y -= moveCam;
		case "singDOWN", "singDOWN-alt":
			PlayState.camFollow.y += moveCam;
	}
}