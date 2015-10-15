// Copyright (c) 2015, Urchin & Abby. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'game_window/GameWindow.dart';
import 'game_window/Fieldname.dart';

GameMap gameMap = new GameMap();

void main() {
	initAudio();
	new Timer(new Duration(seconds: 1), () {
		gameMap.startStory();
	});
}

void initAudio() {
	 audioChoice = new AudioPlayer("choice", CHOICE);
	 audioShout = new AudioPlayer("shout", SHOUT);
	 audioIntro = new AudioPlayer("intro", INTRO_BGM);
	 audioBGM = new AudioPlayer("bgm", BGM, true);
	 audioAnthem = new AudioPlayer("anthem", ANTHEM);
	 audioMagic = new AudioPlayer("magic", MAGIC);
}
