part of GameCore;

class Level {
	int _ID;
	List<String> _dialog;
	List<Instructure> _before;
	List<List<Instructure>> _after;


	Future run(GameManager gm) {
		Completer cmpl = new Completer();
		//run instructures

		//show dialogs
		
		//show question
		
		//waitForAnswer

		//saveChoice
		int choice = 0;
		gm.saveChoice(_ID, choice);

		//run instructures
	}
}

List<Level> LEVELS = {
	new Level(),
	new Level(),
	new Level(),
	new Level(),
	new Level(),
	new Level(),
}