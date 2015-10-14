// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:async';
import 'dart:web_audio';

import 'game_window/GameWindow.dart';
import 'game_window/Fieldname.dart';

GameMap gameMap = new GameMap();
Dialog dialog = new Dialog();

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
	audioBGM = new AudioPlayer("bgm", BGM);
	audioAnthem = new AudioPlayer("anthem", ANTHEM);
	audioMagic = new AudioPlayer("magic", MAGIC);
}
