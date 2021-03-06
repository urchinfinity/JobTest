part of GameWindow;

typedef void TimerCallCackFunction(Timer timer);

List<String> STAND = [".b1", ".f1", ".l1", ".r1"];
List<String> WALK_BACK = [".b1", ".b2", ".b3"];
List<String> WALK_FORWARD = [".f1", ".f2", ".f3"];
List<String> WALK_LEFT = [".l1", ".l2", ".l3"];
List<String> WALK_RIGHT = [".r1", ".r2", ".r3"];

class Character {
	Completer _cmpl;
	Timer _timer;
	TimerCallCackFunction callback;
	DivElement _character;

	static const Duration PERIODIC = const Duration(milliseconds: 60);
	static const int ONE_MOVE = 3; 

	int _mapId = 1;
	int _count;
	int _edge;
	int _curDirection = BACK;

	int get movePixel {
		return ((window.innerWidth * 3 / 5) / digitNum / 3).ceil();
	}

	int get digitNum {
		switch(_mapId) {
			case 1:
				return 32;
			case 2:
				return 40;
			case 3:
				return 40;
			case 4:
				return 40;
			case 5:
				return 40;
			case 6:
				return 40;
			default:
				return 29;
		}
	}

	double get pixelSize => (window.innerWidth * 3 / 5) / digitNum;

	void set mapId(int id) {
		_mapId = id;
	}

	Character(String characterId){
		_character = querySelector(characterId);
	}

	 void show(int top, int left) {
		int halfSize = pixelSize ~/ 3;
		DivElement gameWindow = querySelector("#game-window");
		int bottom = gameWindow.offsetTop + gameWindow.offsetHeight;

		int gamewindowH = 550;
		//_character.style.top = px((bottom - top * size).ceil());
		//_character.style.left = px(((left - 1) * size).ceil());

		_character.style.top = px(gamewindowH - (top * pixelSize).toInt());
		_character.style.left = px((left * pixelSize).toInt());

		_character.style.width = px(((window.innerWidth * 3 / 5) / digitNum).ceil());
		_character.classes.remove('hidden');
	}

	Future hide() {
		_cmpl = new Completer();
		_timer = new Timer(PERIODIC * 3, () {
			_character.classes.add('hidden');
			_cmpl.complete();
		});
		return _cmpl.future;
	}


	Future goBack(int step) {
		_edge = step * ONE_MOVE;
		callback = _goBackCallBack;
		return _move(callback);
	}

	Future goForward(int step) {
		_edge = step * ONE_MOVE + 1;
		callback = _goForwardCallBack;
		return _move(callback);
	}

	Future goLeft(int step) {
		_edge = step * ONE_MOVE;
		callback = _goLeftCallBack;
		return _move(callback);
	}

	Future goRight(int step) {
		_edge = step * ONE_MOVE;
		callback = _goRightCallBack;
		return _move(callback);
	}

	void turnTo(int direction) {
		_character.querySelector(STAND[_curDirection]).classes.add("hidden");
		_character.querySelector(STAND[direction]).classes.remove("hidden");
		_curDirection = direction;
	}

	Future _move(TimerCallCackFunction callback) {
		_cmpl = new Completer();
		_count = 0;
		_timer = new Timer.periodic(PERIODIC, callback);
		return _cmpl.future;
	}


	//callback fuctions
	void _goBackCallBack(Timer _) {
		if (_count == _edge) {
			_cmpl.complete();
			_timer.cancel();
		} else {
			//move
			_character.style.top = px(pxOff(_character.style.top) - movePixel);
			
			//chang picture, first hidden current picture
			//and then, show new picture
			_character.querySelector(WALK_BACK[_count%3]).classes.add("hidden");
			_character.querySelector(WALK_BACK[(_count+1)%3]).classes.remove("hidden");
			
			//count
			_count++;
		}
	}

	void _goForwardCallBack(Timer _) {
		if (_count == _edge) {
			_cmpl.complete();
			_timer.cancel();
		} else {
			//move
			_character.style.top = px(pxOff(_character.style.top) + movePixel);
			
			//chang picture, first hidden current picture
			//and then, show new picture
			_character.querySelector(WALK_FORWARD[_count%3]).classes.add("hidden");
			_character.querySelector(WALK_FORWARD[(_count+1)%3]).classes.remove("hidden");
			
			//count
			_count++;
		}
	}

	void _goLeftCallBack(Timer _) {
		if (_count == _edge) {
			_timer.cancel();
			_cmpl.complete();
		} else {
			//move
			_character.style.left = px(pxOff(_character.style.left) - movePixel);
			
			//chang picture, first hidden current picture
			//and then, show new picture
			_character.querySelector(WALK_LEFT[_count%3]).classes.add("hidden");
			_character.querySelector(WALK_LEFT[(_count+1)%3]).classes.remove("hidden");
			
			//count
			_count++;
		}
	}

	void _goRightCallBack(Timer _) {
		if (_count == _edge) {
			_cmpl.complete();
			_timer.cancel();
		} else {
			//move
			_character.style.left = px(pxOff(_character.style.left) + movePixel);
			
			//chang picture, first hidden current picture
			//and then, show new picture
			_character.querySelector(WALK_RIGHT[_count%3]).classes.add("hidden");
			_character.querySelector(WALK_RIGHT[(_count+1)%3]).classes.remove("hidden");
			
			//count
			_count++;
		}
	}
}

String px(int num) {
  return num.toString() + 'px';
}

int pxOff(String str) {
	return int.parse(str.substring(0, str.length-2));
}
