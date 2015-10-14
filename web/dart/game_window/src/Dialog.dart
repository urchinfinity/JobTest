part of GameWindow;

class Dialog {

	DivElement _textbox;
	DivElement _mask;
	DivElement _img;
	DivElement _contentParent;
	DivElement _optionsParent;

	Dialog() {
		_textbox = querySelector('#dialog');
		_mask = querySelector('#dialog_mask');
		_img = querySelector('#dialog .image');
		_contentParent = querySelector('#dialog .content');
		_optionsParent = querySelector('#dialog .options');
	}

	void showDialog(int lines) {
		_textbox.classes.remove('hidden');
		_textbox.style.height = _px(TEXT_HEIGHT * lines);
		new Timer(const Duration(milliseconds: DIALOG_ANIMATION_DURATION), () {
			_mask.classes.remove('hidden');
		});
	}

	void hideDialog() {
		_mask.classes.add('hidden');
		_textbox.style.height = _px(0);
		new Timer(const Duration(milliseconds: DIALOG_ANIMATION_DURATION), () {
			_textbox.classes.add('hidden');
		});
	}

	void clearDialog() {
		_img.classes.add('hidden');
		_contentParent.children.clear();
		_optionsParent.children.clear();
	}

	void showContent(String content) {
		ParagraphElement p = new ParagraphElement();
		p.innerHtml = content;
		_contentParent.children.add(p);
	} 

	void showOptions(List<String> options) {
		for (int i = 0; i < options.length; i++) {
			ParagraphElement p = new ParagraphElement();
			p.innerHtml = options[i];
			p.id = '$i';
			_optionsParent.children.add(p);
		}
	}

	Future<int> startOptionsListener() {
		Completer cmpl = new Completer();

		List listeners = new List();
		ElementList<ParagraphElement> options = querySelectorAll('#dialog .options p');
		options.forEach((ParagraphElement option) {
			var listener = option.onClick.listen((e) {
				//audioChoice.play();
				listeners.forEach((lstnr) => lstnr.cancel());
				return cmpl.complete(int.parse(option.id));
			});
			listeners.add(listener);
		});
		return cmpl.future;
	}

	void playSound(String soundID) {

	}

	String _px(int num) => '${num}px';
}