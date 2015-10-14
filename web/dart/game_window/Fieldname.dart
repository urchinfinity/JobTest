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

const String AUDIO_CHOICE = "../../source/audio/choice.WAV";

List<int> userChoices = new List(3);
