// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:async';
import 'dart:web_audio';

import 'game_window/GameWindow.dart';

GameMap gameMap = new GameMap();
Dialog dialog = new Dialog();

void main() {
	//AudioPlayer player = new AudioPlayer(new ApplicationContext());
	AudioPlayer player = new AudioPlayer();
	new Timer.periodic(new Duration(seconds: 1), (_) {
		player.play('magic');
//		player.play('shout');
	});
	//gameMap.startStory();
}
