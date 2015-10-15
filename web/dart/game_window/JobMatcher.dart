library JobMatcher;

class JobMatcher {

	List<String> getJob(List<int> choices) {
		switch (choices[0]) {
			case 0:
				switch (choices[1]) {
					case 0:
						switch (choices[2]) {
							case 0:
								return ['政治家', '公關'];
							case 1:
								return ['強盜', '財務'];
							case 2:
								return ['將軍', '會長'];
							case 3:
								return ['記者', '新聞'];
							default:
								return ['', ''];
						}
						return ['', ''];
					case 1:
						switch (choices[2]) {
							case 0:
								return ['建築師', '活動'];
							case 1:
								return ['醫生', '秘書'];
							case 2:
								return ['工程師', '燈音'];
							case 3:
								return ['傳教士', '文化'];
							default:
								return ['', ''];
						}
						return ['', ''];
					default:
						return ['', ''];
				}
				return ['', ''];
			case 1:
				switch (choices[1]) {
					case 0:
						switch (choices[2]) {
							case 0:
								return ['商人', '財務'];
							case 1:
								return ['貧民', '福利'];
							case 2:
								return ['詐騙集團', '外務'];
							case 3:
								return ['律師', '法制'];
							default:
								return ['', ''];
						}
						return ['', ''];
					case 1:
						switch (choices[2]) {
							case 0:
								return ['教授', '學術'];
							case 1:
								return ['預言家', '選委'];
							case 2:
								return ['園丁', '秘書'];
							case 3:
								return ['富二代', '外務'];
							default:
								return ['', ''];
						}
						return ['', ''];
					default:
						return ['', ''];
				}
				return ['', ''];
			default:
				return ['', ''];
		}
	}
}