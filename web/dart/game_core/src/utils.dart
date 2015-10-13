part of GameCore;

class Offset {
  int x, y;

  Offset([this.x = 0, this.y = 0]);

  bool operator==(other) {
    if (other is Offset)
      return x == other.x && y == other.y;
    if (other is List && other.length == 2)
      return x == other[0] && y == other[1];
    return false;
  }

  Offset operator+(Offset offset)
  => new Offset(x + offset.x, y + offset.y);

  Offset swap() => new Offset(y, x);

  int get hashCode => x + y;
  
  String toString() => "($x, $y)";
}

class Announce {
	
}

class Job {
	String _department;
	String _job;

	Jobs(this._job, this._department) {}

	String get department => _department;
	String get job => _job;
}


List<Job> JOBS = [
	new Job("政治家", "公關"),
	new Job("強盜", "財務"),
	new Job("將軍", "會長"),
	new Job("記者", "新聞"),

	new Job("建築師", "活動"),
	new Job("醫生", "秘書"),
	new Job("工程師", "燈音"),
	new Job("傳教士", "文化"),

	new Job("商人", "財務"),
	new Job("貧民", "福利"),
	new Job("詐騙集團", "外務"),
	new Job("律師", "法制"),

	new Job("教授", "學術"),
	new Job("預言家", "選委"),
	new Job("園丁", "秘書"),
	new Job("富二代", "外務"),
];