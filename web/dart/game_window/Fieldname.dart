library Fieldname;

const int TEXT_HEIGHT = 60,
		  DIALOG_ANIMATION_DURATION = 1000,
		  DIALOG_TEXT_DURATION = 1500,
		  STORYLINE_DURATION = 5,
		  OPTIONS_NUM = 4,

		  BACK =0,
		  FORWARD = 1,
		  LEFT = 2,
		  RIGHT = 3;



const String IMG_STORY = "../../source/background/story.png",
			 IMG_CLASSROOM_DARK = "../../source/background/01.png",
			 IMG_CLASSROOM_BRIGHT = "../../source/background/02.png",
			 IMG_NO_BACKGROUND = "",
			 IMG_CHARACTER= "./../source/character/";

const String AUDIO_CHOICE = "../../source/audio/choice.WAV",
			 AUDIO_SHOUT = "../../source/audio/shout.wav",
			 AUDIO_INTRO_BGM = "../../source/audio/intro_bgm.wav",
			 AUDIO_BGM = "../../source/audio/bgm.wav",
			 AUDIO_ANTHEM = "../../source/audio/anthem.wav",
			 AUDIO_MAGIC = "../../source/audio/magic.WAV";

final Map CHOICE = {"choice": AUDIO_CHOICE},
		  SHOUT = {"shout": AUDIO_SHOUT},
		  INTRO_BGM = {"intro": AUDIO_INTRO_BGM},
		  BGM = {"bgm": AUDIO_BGM},
		  ANTHEM = {"anthem": AUDIO_ANTHEM},
		  MAGIC = {"magic": AUDIO_MAGIC};

List<int> userChoices = new List(3);
