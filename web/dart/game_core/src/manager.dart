part of GameCore;

class GameManager {
	List<int> _choose = new List(3);
	int job = 0;
	//charator
	//listener

	Future excuteGame() {
		return Future.foreach(LEVELS, (level)->level.run(this)
		).then((_) {
			//check answer
			//output
		});
	}

	void saveChoice(int levelID, int choice) {
		_choose[levelID] = choice;
	}

	void computeResult() {
		StringBuffer sb = new StringBuffer();
		_choose.foreach((e) => sb.write(e));
		String ch = sb.toString();
		switch(ch.substring(0,1)) {
			case '00':
			job += 0;
			break;
			case '01':
			job += 4;
			break;
			case '10':
			job += 8;
			break;
			case '11':
			job += 12;
			break;
		}
		job += _chhose[2]; 
	}

}
