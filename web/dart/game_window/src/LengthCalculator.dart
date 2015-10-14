part of GameWindow;

class LengthCalculator {

  int get _windowW => window.innerWidth;
  int get _windowH => window.innerHeight;

  int get backgroundWidth => (_windowW * GAME_WINDOW_WIDTH_RATIO).toInt();

  int get b1Height => backgroundWidth *  BACKGROUND_1_HEIGHT ~/ BACKGROUND_1_WIDTH;
  int get b2Height => backgroundWidth *  BACKGROUND_2_HEIGHT ~/ BACKGROUND_2_WIDTH;
  int get b3Height => backgroundWidth *  BACKGROUND_3_HEIGHT ~/ BACKGROUND_3_WIDTH;
  int get b4Height => backgroundWidth *  BACKGROUND_4_HEIGHT ~/ BACKGROUND_4_WIDTH;
  int get b5Height => backgroundWidth *  BACKGROUND_5_HEIGHT ~/ BACKGROUND_5_WIDTH;
  int get b6Height => backgroundWidth *  BACKGROUND_6_HEIGHT ~/ BACKGROUND_6_WIDTH;
}