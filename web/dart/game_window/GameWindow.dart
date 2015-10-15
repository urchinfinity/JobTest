library GameWindow;

import 'dart:html';
import 'dart:async';
import 'dart:web_audio';
import 'dart:js';

import 'Fieldname.dart';
import 'JobMatcher.dart';

part 'src/Dialog.dart';
part 'src/GameMap.dart';
part 'src/GameAudio.dart';
part 'src/BackgroundController.dart';
part 'src/character.dart';

AudioPlayer audioChoice;
AudioPlayer audioShout;
AudioPlayer audioIntro;
AudioPlayer audioBGM;
AudioPlayer audioAnthem;
AudioPlayer audioMagic;
