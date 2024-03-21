var stage:Stage = null;
function create() {
	stage = loadStage('rock');
}
function update(elapsed) {
	stage.update(elapsed);
}
function beatHit(curBeat) {
	stage.onBeat();
}