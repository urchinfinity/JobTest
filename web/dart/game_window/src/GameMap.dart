part of GameWindow;

class GameMap {
	
	ImageElement _background;
	DivElement _character;
	Dialog dialog;

	GameMap() {
		_background = querySelector('#map img');
		_character = querySelector('#main_character');

		dialog = new Dialog();
	}

	void switchMap(int id) {
	}

	void startStory() {
		//_startBackgroundStory();
		_startStoryline0();
	}

	void _startBackgroundStory() {
		_background.src = IMG_STORY;
		ElementList<ParagraphElement> storyLines = querySelectorAll('#map .content p');
		int curP = 0;
		Timer timer;

		storyLines[curP++].style.width = '100%';
		timer = new Timer.periodic(new Duration(seconds: STORYLINE_DURATION), (_) {
			if (curP < storyLines.length)
				storyLines[curP].style.width = '100%';
			else if (curP == storyLines.length + 1) {
				_background.src = IMG_NO_BACKGROUND;
				querySelector('#map .content').classes.add('hidden');
				timer.cancel();
		
				_startStoryline0();
			}
			curP++;
		});
	}

	void _startStoryline0() {
		int curP = 0;
		Timer timer;

		_background.src = IMG_CLASSROOM_DARK;
		dialog.showDialog(2);

		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					dialog.showContent('「大家怎麼不開燈呢？同學幫我開個燈！」');
					break;
				case 1:
					_background.src = IMG_CLASSROOM_BRIGHT;
					dialog.clearDialog();
					dialog.showDialog(3);
					break;
				case 2:
					dialog.showContent('「今天來上課的人滿多的嘛～不錯不錯」');
					break;
				case 3:
					dialog.showContent('「那繼續上禮拜的進度，大家翻到 87 頁，所以呢…在這一頁我們可以看到」');
					break;
				case 4:
					_background.classes.add('blur');
					break;
				case 5:
					dialog.clearDialog();
					dialog.showContent('悠悠的教室中，漸漸沉睡於老師平淡的音調...');
					break;
				case 6:
					dialog.showContent('(乾～怎麼可以這麼好睡...)');
					break;
				case 7:
					dialog.clearDialog();
					dialog.showDialog(5);
					break;
				case 8:
					dialog.showContent('印象中…這堂課是');
					break;
				case 9:
					dialog.showOptions(['A 社會學', 'B 微積分', 'C 行政學', 'D 財稅學']);
					break;
				default:			
					dialog.startOptionsListener((int optionID) {
						print(optionID);
					});
					timer.cancel();
			}
		});
	}

	void _startWalking() {

	}
}