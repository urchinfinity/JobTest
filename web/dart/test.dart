// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:math';
import 'dart:async';

import 'dart:js' as js;

import 'game_window/GameWindow.dart';

GameMap gameMap = new GameMap();
Dialog dialog = new Dialog();

void main() {
	gameMap.startStory();
}
