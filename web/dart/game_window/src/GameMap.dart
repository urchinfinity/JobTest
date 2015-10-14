part of GameWindow;

class GameMap {
	
	ImageElement _background;
	DivElement _character;
	Dialog dialog;
	Character character;
	BackgroundController bgCntrl;

	GameMap() {
		_background = querySelector('#map img');
		_character = querySelector('#main_character');
		character = new Character('#main_character');
		bgCntrl = new BackgroundController();

		dialog = new Dialog();
	}

//	void switchMap(int id) {}

	void startStory() {
//		_startBackgroundStory();
//		.then((_) => _startStoryline0());
//		_startStoryline1();
//		.then((_) => _startStoryline1())
//		.then((_) => _startStoryline2_1())
//		.then((_) => _startStoryline2_2())
//		.then((_) => _startStoryline3())
//		.then((_) => _startStoryline4())
//		.then((_) => _startStoryline5())
//		.then((_) => _startStoryline6());

		_startStoryline2_1();
	}

	Future _startBackgroundStory() {
		Completer cmpl = new Completer();

		_background.src = IMG_STORY;
		//audioIntro.play();

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
				//audioIntro.stop();
				return cmpl.complete();
			}
			curP++;
		});

		return cmpl.future;
	}

	Future _startStoryline0() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;

		_background.src = IMG_CLASSROOM_DARK;

		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					dialog.showDialog(2);
					break;
				case 1:
					dialog.showContent('「大家怎麼不開燈呢？同學幫我開個燈！」');
					break;
				case 2:
					_background.src = IMG_CLASSROOM_BRIGHT;
					dialog.clearDialog();
					dialog.showDialog(3);
					break;
				case 3:
					dialog.showContent('「今天來上課的人滿多的嘛～不錯不錯」');
					break;
				case 4:
					dialog.showContent('「那繼續上禮拜的進度，大家翻到 87 頁，所以呢…在這一頁我們可以看到」');
					break;
				case 5:
					_background.classes.add('blur');
					break;
				case 6:
					dialog.clearDialog();
					dialog.showContent('悠悠的教室中，漸漸沉睡於老師平淡的音調...');
					break;
				case 7:
					dialog.showContent('(乾～怎麼可以這麼好睡...)');
					break;
				case 8:
					dialog.clearDialog();
					dialog.showDialog(5);
					break;
				case 9:
					dialog.showContent('印象中…這堂課是');
					break;
				default:
					timer.cancel();	

					dialog.showOptions(['A 社會學', 'B 微積分', 'C 行政學', 'D 財稅學']);
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete();
					});
			}
		});
		return cmpl.future;
	}

	Future _startStoryline1() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					audioMagic.play();
					break;
				case 1:
					audioBGM.play();
					break;
				case 2:
					_background.src = IMG_BACKGROUND_1;
					character.show(650, 430);
					_background.classes.remove('blur');
					break;
				case 3:
					break;
				default:
					timer.cancel();
					cmpl.complete();
			}
		});
		return cmpl.future.then((_) {
			return character.goBack(2);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.showDialog(4);
					break;
				case 1:
					dialog.showContent('１１月１４日晚上五點半到九點');
					break;
				case 2:
					dialog.showContent('在椰林大道有學生會文化部辦的 我就尬藝你市集 喔～');
					break;
				case 3:
					dialog.showContent('就在大富翁下午場結束後。');
					break;
				case 4:
					dialog.clearDialog();
					dialog.hideDialog();
					break;
				default:
					timer.cancel();
					cmpl.complete();
				}
			});
			return cmpl.future;
		}).then((_){
			character.turnTo(LEFT);
			return character.goLeft(1);
		}).then((_){
			character.turnTo(BACK);
			return character.goBack(15);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.showDialog(4);
					break;
				case 1:
					dialog.showContent('左方道路突然傳來尖叫聲');
					break;
				case 2:
					dialog.showContent('我要往');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 左邊走', 'B 右邊走']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						//mapPosLander()
						//.then((_) => cmpl.complete());
						cmpl.complete(choice);
					});
				}
			});
			return cmpl.future;
		}).then((choice) {
			switch(choice) {
				case 0:
					return _startStoryline1Result0();
				case 1:
					return _startStoryline1Result1();
			}
		});
	}

	Future _startStoryline1Result0() {
		character.turnTo(LEFT);
		return character.goLeft(14).then((_) {
			character.turnTo(BACK);
			return character.goBack(10);
		}).then((_) => character.hide());
	}


	Future _startStoryline1Result1() {
		character.turnTo(RIGHT);
		return character.goRight(15).then((_) {
			character.turnTo(BACK);
			return character.goBack(10);
		}).then((_) => character.hide());
	}

	Future _startStoryline2_1() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;
		character.mapId = 2;

		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					break;
				case 1:
					_background.src = IMG_BACKGROUND_2;
					character.show(620, 635);
					break;
				case 2:
					dialog.showDialog(4);
					break;
				case 3:
					dialog.showContent('學生會公關部推出了手機殼系列商品');
					break;
				case 4:
					dialog.showContent('不管你愛的是雨中腳踏車的文青意象，遇到 112 必推的鄉民精神');
					break;
				case 5:
					dialog.showContent('或是總圖的莊嚴美感，與優雅的入夜校史館');
					break;
				case 6:
					dialog.showContent('我們讓你把最愛的校園，與手機合而為一。');
					break;
				case 7:
					dialog.clearDialog();
					dialog.hideDialog();
					break;
				default:
					timer.cancel();
					startNoteListener()
					.then((_) => cmpl.complete());
				}
			});
		return cmpl.future.then((_){
			character.turnTo(LEFT);
			return character.goLeft(9);
		}).then((_){
			character.turnTo(BACK);
			return character.goBack(10);
		});
	}

	Future startNoteListener() {
		Completer cmpl = new Completer();
		//DivElement note = querySelector('');
		//note.onClick.listen((e) => cmpl.complete());
		new Timer(new Duration(seconds: 1), () => cmpl.complete());
		return cmpl.future;
	}


	Future _startStoryline2_2() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;

		dialog.showDialog(4);
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					dialog.showContent('「右方道路放著一個寶箱」');
					break;
				case 1:
					dialog.showContent('我要往');
					break;
				default:
					timer.cancel();	
					dialog.showOptions(['A 左邊走', 'B 右邊走']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete(choice);
					});
			}
		});
		return cmpl.future.then((choice) {
			switch(choice) {
				case 0:
					return _startStoryline2Result0();
				case 1:
					return _startStoryline2Result1();
			}
		});
	}

	Future _startStoryline2Result0() {
		character.turnTo(LEFT);
		return character.goLeft(15).then((_) {
			character.turnTo(BACK);
			return character.goBack(16);
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(1);
		}).then((_) => character.hide());
	}


	Future _startStoryline2Result1() {
		character.turnTo(RIGHT);
		return character.goRight(16).then((_) {
			character.turnTo(BACK);
			return character.goBack(16);
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(1);
		}).then((_) => character.hide());
	}

	Future _startStoryline3() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;
		character._mapId = 3;
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					break;
				case 1:
					_background.src = IMG_BACKGROUND_3;
					character.show(640, 510);
					character.turnTo(BACK);
					break;
				case 2:
					dialog.showDialog(3);
					break;
				case 3:
					dialog.showContent('１１月９日到１１月２０日在博雅');
					break;
				case 4:
					dialog.showContent('有學生會學術部辦的 刮亮臺大 靜態互動展');
					break;
				case 5:
					dialog.showContent('期中考周讀累了可以去刮兩下舒解壓力～');
					break;
				default:
					dialog.clearDialog();
					dialog.hideDialog();
					timer.cancel();
					cmpl.complete();
				}
			});
		return cmpl.future.then((_){
			character.turnTo(LEFT);
			return character.goLeft(6);
		}).then((_){
			character.turnTo(BACK);
			return character.goBack(3);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.clearDialog();
					dialog.showDialog(3);
					break;
				case 1:
					dialog.showContent('每週三四五中午都可以去 活大237 學生會辦繳會費喔～');
					break;
				case 2:
					dialog.showContent('一學期只要超低價 150 元，在各種報名活動中還可享有優惠價！');
					break;
				default:
					dialog.clearDialog();
					dialog.hideDialog();
					timer.cancel();
					cmpl.complete();
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(1);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(9);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.clearDialog();
					dialog.showDialog(2);
					dialog.showContent('搞屁啊什麼爛設定？出現了一條河卻找不到橋...');
					break;
				case 1:
					dialog.clearDialog();
					dialog.showDialog(5);
					break;
				case 2:
					dialog.showContent('好吧不然我勉強一下');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 自己造一座橋', 'B 游泳渡河', 'C 造一艘竹筏', 'D call out']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete(choice);
					});
				}
			});
			return cmpl.future;
		}).then((choice) => character.goBack(11)).then((_){character.hide();});
	}


	Future _startStoryline4() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;

		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					break;
				case 1:
					_background.src = IMG_BACKGROUND_4;
					character.show(640, 440);
					break;
				case 2:
					dialog.showDialog(2);
					break;
				case 3:
					dialog.showContent('大家可以追蹤臺大學生會臉書粉絲專頁 follow 最新消息喔～');
					break;
				case 4:
					dialog.clearDialog();
					dialog.hideDialog();
					break;
				case 5:
					//TODO: shake
					break;
				case 6:
					dialog.showDialog(2);
					break;
				case 7:
					dialog.showContent('！！！');
					break;
				case 8:
					dialog.clearDialog();
					dialog.showContent('前面的草叢怎麼會有怪聲和動靜？');
					break;
				case 9:
					dialog.clearDialog();
					dialog.showDialog(5);
					break;
				case 10:
					dialog.showContent('該不會是');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 大笨鳥', 'B 蛇', 'C 松鼠', 'D 小熊維尼']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete();
					});
			}
		});
		return cmpl.future.then((_) {
			character.turnTo(LEFT);
			return character.goLeft(3);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(2);
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(15);
		}).then((_) {
			return character.hide();
		});
	}

	Future _startStoryline5() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;
		character.mapId = 5;
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					break;
				case 1:
					_background.src = IMG_BACKGROUND_5;
					character.show(680, 405);
					character.turnTo(BACK);
					break;
				case 2:
					dialog.showDialog(3);
					break;
				case 3:
					dialog.showContent('別錯過臺大學生會新聞部發行的 花火時代 ！');
					break;
				case 4:
					dialog.showContent('在臺大校園各處公共空間及宿舍都可以免費索取。');
					break;
				case 5:
					dialog.showContent('也別忘了到花火的粉絲專頁按讚支持！');
					break;
				default:
					dialog.clearDialog();
					dialog.hideDialog();
					timer.cancel();
					cmpl.complete();
				}
			});
		return cmpl.future.then((_){
			character.turnTo(LEFT);
			return character.goLeft(1);
		}).then((_){
			character.turnTo(BACK);
			return character.goBack(6);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.clearDialog();
					dialog.showDialog(4);
					break;
				case 1:
					dialog.showContent('什麼？這什麼鬼地方啊！');
					break;
				case 2:
					dialog.showContent('草原突然分成三個世界，');
					break;
				case 3:
					dialog.showContent('左邊是是黃沙滾滾的沙漠，中間聳立起一座高山，右邊是一整片的黑森林？！');
					break;
				case 4:
					dialog.clearDialog();
					dialog.showContent('要往哪邊去呢...');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 沙漠', 'B 山洞', 'C 黑森林']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete(choice);
					});
				}
			});
			return cmpl.future;
		}).then((choice) {
			switch(choice) {
				case 0:
					return _startStoryline5Result0();
				case 1:
					return _startStoryline5Result1();
				case 2:
					return _startStoryline5Result2();
			}
		});
	}

	Future _startStoryline5Result0() {
		character.turnTo(LEFT);
		return character.goLeft(7).then((_) {
			character.turnTo(BACK);
			return character.goBack(7);
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(5);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(11);
		}).then((_) {
			return character.hide();
		});
	}	

	Future _startStoryline5Result1() {
		return character.goBack(18).then((_) => character.hide());	
	}

	Future _startStoryline5Result2() {
		character.turnTo(RIGHT);
		return character.goRight(9).then((_) {
			character.turnTo(BACK);
			return character.goBack(7);
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(4);
		}).then((_) {
			return character.hide();
		});
	}

	void _startStoryline6() {
		int curP = 0;
		Timer timer;
		character.mapId = 5;

		//audioBGM.stop();
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_background.src = IMG_NO_BACKGROUND;
					//audioMagic.play();
					break;
				case 1:
					_background.src = IMG_BACKGROUND_6;
					character.show(420, 410);
					character.turnTo(FORWARD);
					//audioAnthem.play();
					break;
				case 2:
					dialog.showDialog(3);
					break;
				case 3:
					dialog.showContent('恭喜你完成了湊熱鬧職業性向測驗，');
					break;
				case 4:
					dialog.showContent('依照剛剛的選擇，你最適合的職業是 _ _ _ ');
					break;
				case 5:
					dialog.showContent('推薦你去學生會 _ _ _ 面試看看，有 87% 的機率會被錄取。');
					break;
				case 6:
					dialog.showDialog(9);
					dialog.showContent('--');
					break;
				case 7:
					dialog.showContent('如果想成為大富翁，記得在報名後確認隊長信箱有無收到認證信，');
					break;
				case 8:
					dialog.showContent('並於 10/26~10/28 到活大 237 繳費換取執照，逾期將取消你的職業資格。');
					break;
				case 9:
					dialog.showContent('11/14 記得到集合地點參加就職典禮。');
					break;
				case 10:
					dialog.showContent('成為大富翁後別吝嗇到椰林大道去逛逛「我就尬藝你」市集，');
					break;
				case 11:
					dialog.showContent('拿著你賺到的大把鈔票買下整條街！');
					break;
				case 12:
					break;
				case 13:
					break;
				case 14:
					dialog.clearDialog();
					dialog.showDialog(7);
					break;
				case 15:
					dialog.showContent('台大學生會 87 週年校慶，歡迎你一起來湊！熱！鬧！');
					break;
				default:
					timer.cancel();
					dialog.showContent('11/9~11/20 刮亮臺大');
					dialog.showContent('11/14 09:00~17:30 臺大大富翁');
					dialog.showContent('11/14 14:00~17:00 彩繪椰林大道');
					dialog.showContent('11/14 17:30~21:00 我就尬藝你');
					dialog.showContent('11/14 21:30~無極限!!! 臺大之夜');
					break;
			}
		});
	}

	Future mapPosLander() {
		Completer cmpl = new Completer();
		Timer timer;
print('height' + _background.style.width);
		timer = new Timer.periodic(new Duration(milliseconds: 50), (_) {
			if (curTop == 1) {
				timer.cancel();
				return cmpl.complete();
			} else {
				curTop = curTop - 5 < 1 ? 1 : curTop - 5;
				_background.style.top = '${curTop}px';
			}
		});
		return cmpl.future;
	}
}