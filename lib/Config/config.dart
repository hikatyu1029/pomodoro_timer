class Config {
  Config._internal();
  static final Config _cache = Config._internal();

  factory Config() {
    return _cache;
  }

  // 設定中タイマー
  int setCount = 1500;

  // 現在のカウント
  int count = 1500;

  int workTime = 1500;

  int restTime = 300;

  // 連続再生フラグ
  bool continueFlg = false;

  void reset() {
    count = setCount;
  }

  void setTime(int m) {
    switch (m) {
      case 0:
        setCount = workTime;
        count = workTime;
        break;
      case 1:
        setCount = restTime;
        count = restTime;
        break;
    }
  }
}
