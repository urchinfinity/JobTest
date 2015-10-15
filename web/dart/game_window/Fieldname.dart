library Fieldname;

const int TEXT_HEIGHT = 55,
		  GAME_WINDOW_HEIGHT = 550,
		  DIALOG_ANIMATION_DURATION = 1000,
		  DIALOG_TEXT_DURATION = 2000,
		  STORYLINE_DURATION = 5,

          BACKGROUND_1_WIDTH = 32,
          BACKGROUND_1_HEIGHT = 39,
          BACKGROUND_2_WIDTH = 40,
          BACKGROUND_2_HEIGHT = 38,
          BACKGROUND_3_WIDTH = 40,
          BACKGROUND_3_HEIGHT = 30,
          BACKGROUND_4_WIDTH = 40,
          BACKGROUND_4_HEIGHT = 31,
          BACKGROUND_5_WIDTH = 40,
          BACKGROUND_5_HEIGHT = 30,
          BACKGROUND_6_WIDTH = 29,
          BACKGROUND_6_HEIGHT = 30,

		  BACK =0,
		  FORWARD = 1,
		  LEFT = 2,
		  RIGHT = 3;

const double GAME_WINDOW_WIDTH_RATIO = 0.6;


const String IMG_STORY = "../source/background/story.png",
			 IMG_CLASSROOM_DARK = "../source/background/01.png",
			 IMG_CLASSROOM_BRIGHT = "../source/background/02.png",
			 IMG_BACKGROUND_1 = "../source/background/1.png",
			 IMG_BACKGROUND_2 = "../source/background/2.png",
			 IMG_BACKGROUND_3 = "../source/background/3.png",
			 IMG_BACKGROUND_4 = "../source/background/4.png",
			 IMG_BACKGROUND_5 = "../source/background/5.png",
			 IMG_BACKGROUND_6 = "../source/background/6.png",
			 IMG_NO_BACKGROUND = "",
			 IMG_CHARACTER= "../source/character/";

const String AUDIO_CHOICE = "../../source/audio/choice.mp3",
			 AUDIO_SHOUT = "../../source/audio/shout.mp3",
			 AUDIO_INTRO_BGM = "../../source/audio/intro_bgm.mp3",
			 AUDIO_BGM = "../../source/audio/bgm.mp3",
			 AUDIO_ANTHEM = "../../source/audio/anthem.mp3",
			 AUDIO_MAGIC = "../../source/audio/magic.mp3";

final Map CHOICE = {"choice": AUDIO_CHOICE},
		  SHOUT = {"shout": AUDIO_SHOUT},
		  INTRO_BGM = {"intro": AUDIO_INTRO_BGM},
		  BGM = {"bgm": AUDIO_BGM},
		  ANTHEM = {"anthem": AUDIO_ANTHEM},
		  MAGIC = {"magic": AUDIO_MAGIC};

List<int> userChoices = new List();
