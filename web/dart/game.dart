// Copyright (c) 2015, Urchin & Abby. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:html';

import 'game_window/GameWindow.dart';

GameMap gameMap = new GameMap();

void main() {
	initAudio();
	new Timer(new Duration(seconds: 1), () {
		gameMap.startStory();
	});
}

void initAudio() {
	  audioChoice = new AudioPlayer(querySelector('#audio-choice'));
	  audioShout = new AudioPlayer(querySelector('#audio-shout'));
	  audioIntro = new AudioPlayer(querySelector('#audio-intro'));
	  audioBGM = new AudioPlayer(querySelector('#audio-bgm'));
	  audioAnthem = new AudioPlayer(querySelector('#audio-anthem'));
	  audioMagic = new AudioPlayer(querySelector('#audio-magic'));
}
