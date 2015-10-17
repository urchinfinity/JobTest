part of GameWindow;

class GameMap {
	
	ElementList<ImageElement> _backgrounds;
	DivElement _character;
	Dialog dialog;
	Character character;
	BackgroundController bgCntrl;
	JobMatcher matcher;

	GameMap() {
		_backgrounds = querySelectorAll('#map img');
		_character = querySelector('#main_character');
		character = new Character('#main_character');
		bgCntrl = new BackgroundController();
		matcher = new JobMatcher();

		dialog = new Dialog();
	}

	void startStory() {
		  // _startStoryline1()
		 _startBackgroundStory()
		 .then((_) => _startStoryline1())
		 .then((_) => _startStoryline2())
		.then((_) => _startStoryline3())
		.then((_) => _startStoryline4())
		.then((_) => _startStoryline5())
		.then((_) => _startStoryline6());
	}

	Future _startBackgroundStory() {
		Completer cmpl = new Completer();

		_backgrounds[0].classes.remove('hidden');
		audioIntro.play();

		DivElement backgroundStory = querySelector('#map .content');
		backgroundStory.classes.remove('hidden');
		backgroundStory.classes.remove('ease-in');
		int curP = 0;
		Timer timer;

		timer = new Timer.periodic(new Duration(seconds: STORYLINE_DURATION), (_) {
			switch (curP++) {
				case 0:
					break;
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				case 4:
					break;
				default:
					timer.cancel();
					backgroundStory.classes.add('ease-in');
					_backgrounds[0].classes.add('hidden');
					audioIntro.stop();
					return cmpl.complete();
			}
		});
		return cmpl.future;
	}

	Future _startMouseListener() {
		Completer cmpl = new Completer();
		var listener;

		listener = querySelector('#game-window').onClick.listen((e) {
			listener.cancel();
			dialog.clearDialog();
			dialog.hideDialog();
			new Timer(new Duration(milliseconds: DIALOG_ANIMATION_DURATION), () => cmpl.complete());
		});
		return cmpl.future;
	}

	Future _startStoryline1() {
		Completer cmpl = new Completer();
		int curP = 0;
		Timer timer;
		querySelector('#map .content').classes.add('hidden');
		audioMagic.play();
		audioBGM.play();
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_backgrounds[1].classes.remove('hidden');
					character.show(3, 16);
					dialog.showDialog(2);
					break;
				default:
					timer.cancel();
					dialog.showContent('進工會有甚麼難的！你走進天龍城……');
					return _startMouseListener()
					.then((_) => cmpl.complete());
			}
		});
		return cmpl.future.then((_) {
			return character.goBack(2);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('各路英雄不容錯過的精采會面');
						break;
					case 1:
						dialog.showContent('就在１１月１４日晚上五點半到九點');
						break;
					case 2:
						dialog.showContent('在椰林大道 我就尬藝你市集');
						break;
					default:
						timer.cancel();
						dialog.showContent('結識各方好漢就趁現在！');
						return _startMouseListener()
						.then((_) => cmpl.complete());
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(1);
		}).then((_) {
			character.turnTo(BACK);
			return bgCntrl.startTranslate(character.pixelSize * 14, 1);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;
 			audioShout.play();
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					break;
				case 1:
					break;
				case 2:
					dialog.showDialog(4);
					break;
				case 3:
					dialog.showContent('左方道路突然傳來慘叫聲……');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 左邊走', 'B 右邊走']);
					
					dialog.startOptionsListener()
					.then((choice) {
						userChoices.add(choice);
						dialog.clearDialog();
						dialog.hideDialog();
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
		return character.goLeft(13).then((_) {
			character.turnTo(BACK);
			return character.goBack(13);
		}).then((_) => character.hide());
	}


	Future _startStoryline1Result1() {
		character.turnTo(RIGHT);
		return character.goRight(13).then((_) {
			character.turnTo(BACK);
			return character.goBack(13);
		}).then((_) => character.hide());
	}

	Future _startStoryline2() {
		Completer cmpl = new Completer();
		character.mapId = 2;

		_backgrounds[1].classes.add('hidden');
		new Timer(new Duration(milliseconds: DIALOG_TEXT_DURATION), () {
			_backgrounds[2].classes.remove('hidden');
			character.show(1, 34);
			return cmpl.complete();
		});
		return cmpl.future.then((_) => character.goBack(5))
		.then((_) {
			character.turnTo(LEFT);
			return character.goLeft(4);
		}).then((_) {
			character.turnTo(BACK);
		
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('豪華裝備展現英雄本色');
						break;
					case 1:
						dialog.showContent('隨身攜帶的手機，怎能沒有一個帶的出場的手機殼');
						break;
					default:
						timer.cancel();
						dialog.showContent('公關部應有盡有，包君滿意！');
						return _startMouseListener()
						.then((_) => cmpl.complete());
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(10);
		}).then((_) {
			character.turnTo(BACK);
			return bgCntrl.startTranslate(character.pixelSize * 11, 2);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('「你看向遠方，右方道路好像放著一個寶箱……」');
						break;
					default:
						timer.cancel();	
						dialog.showOptions(['A 往左走', 'B 往右走']);
						
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
					return _startStoryline2Result0();
				case 1:
					return _startStoryline2Result1();
			}
		});
	}

	Future _startStoryline2Result0() {
		character.turnTo(LEFT);
		return character.goLeft(16).then((_) {
			character.turnTo(BACK);
			return character.goBack(17);
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(1);
		}).then((_) => character.hide());
	}


	Future _startStoryline2Result1() {
		character.turnTo(RIGHT);
		return character.goRight(16).then((_) {
			character.turnTo(BACK);
			return character.goBack(17);
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

		_backgrounds[2].classes.add('hidden');
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_backgrounds[3].classes.remove('hidden');
					character.show(1, 24);
					character.turnTo(BACK);
					dialog.showDialog(2);
					break;
				case 1:
					dialog.showContent('噢喔噢！終於走出那詭異的長廊了…嚇屎人（汗');
					break;
				default:
					timer.cancel();
					dialog.showContent('怎麼會有一堆枯骨啊＝＝嚇屎人（汗');
					return _startMouseListener()
					.then((_) => cmpl.complete());
			}
		});
		return cmpl.future.then((_) => character.goBack(4))
		.then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('號外！大安預定地有不為人知的天大過去？！');
						break;
					case 1:
						dialog.showContent('１１月９日到１１月２０日在博雅 刮亮臺大 靜態互動展');
						break;
					default:
						timer.cancel();
						dialog.showContent('和學術部一起揭開面紗吧！');
						return _startMouseListener()
						.then((_) => cmpl.complete());
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(7);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(3);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('好康道相報！');
						break;
					case 1:
						dialog.showContent('每週三四五中午都可以去活大237繳學生會費150元');
						break;
					default:
						timer.cancel();
						dialog.showContent('保證優惠拿不完！');
						return _startMouseListener()
						.then((_) => cmpl.complete());
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(2);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(9);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(4);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.showContent('怎麼會有一條河啊？');
					break;
				case 1:
					dialog.showContent('走了這麼久，連個鬼房子都沒看到，還要找職業工會？！');
					break;
				case 2:
					dialog.showContent('不能就這樣放棄！');
					break;
				case 3:
					break;
				case 4:
					dialog.clearDialog();
					dialog.showDialog(5);
					break;
				case 5:
					dialog.showContent('你決定……');
					break;
				default:
					timer.cancel();
					dialog.showOptions(['A 自己造一座橋', 'B 游泳渡河', 'C 造一艘竹筏', 'D call out']);
					
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
		}).then((_) {
			_backgrounds[3].classes.add('hidden');
			return character.hide();
		}).then((_) {
			Completer cmpl = new Completer();

			new Timer(new Duration(seconds: 1), () {
				_backgrounds[3].classes.remove('hidden');
				_backgrounds[3].style.top = '0px';
				character.show(20, 18);
				new Timer(new Duration(seconds: 1), () {
					return character.goBack(4)
					.then((_) => character.hide())
					.then((_) => cmpl.complete());
				});
			});
			return cmpl.future;
		});
	}


	Future _startStoryline4() {
		Completer cmpl = new Completer();
		character._mapId = 4;

		_backgrounds[3].classes.add('hidden');
		new Timer(new Duration(milliseconds: DIALOG_TEXT_DURATION), () {
			_backgrounds[4].classes.remove('hidden');
			character.show(1, 21);
			return cmpl.complete();
		});
		return cmpl.future.then((_) => character.goBack(4))
		.then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(2);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('猛獸出沒！');
						break;
					case 1:
						break;
					default:
						timer.cancel();
						dialog.clearDialog();
						dialog.hideDialog();
						return cmpl.complete();
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(2);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(8);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(2);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('前面的樹林怎麼感覺怪怪的，好像有什麼躲在裡面？');
						break;
					case 1:
						dialog.showDialog(5);
						break;
					case 2:
						dialog.showContent('你握緊在口袋裡的刀，往前探去，竟然是……');
						break;
					default:
						timer.cancel();
						dialog.showOptions(['A 大笨鳥', 'B 蛇蛇', 'C 松鼠', 'D 小熊維尼']);
						
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
		}).then((_) {
			return character.goBack(1);
		}).then((_) {
			return character.hide();
		});
	}

	Future _startStoryline5() {
		Completer cmpl = new Completer();
		character.mapId = 5;

		_backgrounds[4].classes.add('hidden');
		new Timer(new Duration(milliseconds: DIALOG_TEXT_DURATION), () {
			_backgrounds[5].classes.remove('hidden');
			character.show(1, 19);
			character.turnTo(BACK);
			return cmpl.complete();
		});
		return cmpl.future.then((_) => character.goBack(2))
		.then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(3);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
					case 0:
						dialog.showContent('聽說在大安預定地各處公共空間及宿舍擺放著可以得知各角落祕密的神祕刊物「花火時代」');
						break;
					default:
						timer.cancel();
						dialog.showContent('閱讀他的人就可以得知新世界的最新動向？！');
						return _startMouseListener()
						.then((_) => cmpl.complete());
				}
			});
			return cmpl.future;
		}).then((_) {
			character.turnTo(LEFT);
			return character.goLeft(1);
		}).then((_) {
			character.turnTo(BACK);
			return character.goBack(6);
		}).then((_) {
			Completer cmpl = new Completer();
			int curP = 0;
			Timer timer;

			dialog.showDialog(3);
			timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
				switch (curP++) {
				case 0:
					dialog.showContent('草原突然分成三個世界，');
					break;
				case 1:
					dialog.showContent('左邊是是黃沙滾滾的沙漠，中間聳立起一座高山，右邊是一整片的黑森林？！');
					break;
				case 2:
					dialog.showDialog(7);
					break;
				case 3:
					dialog.showContent('俗話說：「冬天來了，春天也不遠了」，職業工會一定是在……');
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
			return character.goBack(7);
		}).then((_) {
			return character.hide();
		});
	}	

	Future _startStoryline5Result1() {
		return character.goBack(11).then((_) {
			character.turnTo(LEFT);
			character.hide();
		});	
	}

	Future _startStoryline5Result2() {
		character.turnTo(RIGHT);
		return character.goRight(7).then((_) {
			character.turnTo(BACK);
			return character.goBack(7);
		}).then((_) {
			character.turnTo(RIGHT);
			return character.goRight(7);
		}).then((_) {
			return character.hide();
		});
	}

	void _startStoryline6() {
		int curP = 0;
		Timer timer;
		character.mapId = 6;

		List<String> results = matcher.getJob(userChoices.sublist(0, 3));
		
		audioBGM.stop();
		_backgrounds[5].classes.add('hidden');
		audioMagic.play();
		timer = new Timer.periodic(new Duration(milliseconds: DIALOG_TEXT_DURATION), (_) {
			switch (curP++) {
				case 0:
					_backgrounds[6].classes.remove('hidden');
					_backgrounds[6].style.top = '${-(character.pixelSize * 5).toInt()}px';
					character.show(3, 19);
					character.turnTo(BACK);
					audioAnthem.play();
					 _showNPC();
					break;
				case 1:
					dialog.showDialog(3);
					break;
				case 2:
					dialog.showContent('恭喜你完成了大富翁職業性向測驗，');
					break;
				case 3:
					dialog.showContent('依照剛剛的選擇，你最適合的職業是 ${results[0]} ');
					break;
				case 4:
					dialog.showContent('推薦你去學生會 ${results[1]} 面試看看，有 87% 的機率會被錄取。');
					break;
				case 5:
					break;
				case 6:
					break;
				case 7:
					dialog.showDialog(11);
					dialog.showContent('--');
					break;
				case 8:
					dialog.showContent('有這樣職業技能的你，怎麼能錯過開發大安預定地的活動！');
					break;
				case 9:
					dialog.showContent('一起來成為大富翁吧！');
					break;
				case 10:
					dialog.showContent('記得在報名後確認隊長信箱有無收到認證信，');
					break;
				case 11:
					dialog.showContent('並於10/26~10/28到活大237繳費換取執照，');
					break;
				case 12:
					dialog.showContent('逾期將取消你的職業資格。');
					break;
				case 13:
					dialog.showContent('11/14記得到博雅101教室參加就職典禮。');
					break;
				case 14:
					break;
				case 15:
					break;
				case 16:
					dialog.clearDialog();
					dialog.showDialog(7);
					break;
				case 17:
					dialog.showContent('臺灣大學87週年校慶，學生會歡迎你一起來湊！熱！鬧！');
					break;
				default:
					timer.cancel();
					dialog.showContent('11/9 ~ 11/20 刮亮臺大');
					dialog.showContent('11/14 08:30 ~ 17:30 臺大大富翁');
					dialog.showContent('11/14 14:00 ~ 17:00 彩繪椰林大道');
					dialog.showContent('11/14 17:30 ~ 21:00 我就尬藝你');
					dialog.showContent('11/14 21:00 ~ 08:00 臺大之夜');
					break;
			}
		});
	}

	void _showNPC() {
		int left = (character.pixelSize * 19).toInt();
		int top = (character.pixelSize * 18).toInt();

		querySelector('#npc')
			..classes.remove('hidden')
			..style.top = '${top}px'
			..style.left = '${left}px';
	}
}