class Config {
  Config._internal();
  static final Config _cache = Config._internal();

  factory Config() {
    return _cache;
  }

  // 設定中タイマー
  int setCount = 300;

  // 現在のカウント
  int count = 300;

  // 連続再生フラグ
  bool continueFlg = false;

  void reset() {
    count = setCount;
  }

  void setTiome(int t) {
    setCount = t;
    count = t;
  }
}
