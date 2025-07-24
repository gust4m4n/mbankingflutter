extension SafeMap on Map {
  String getString(String key) {
    var value = this[key];
    if (value == null) {
      return '';
    } else {
      return value;
    }
  }

  int getInt(String key) {
    var value = this[key];
    if (value == null) {
      return 0;
    } else {
      return value;
    }
  }

  double getDouble(String key) {
    var value = this[key];
    if (value == null) {
      return 0.0;
    } else {
      return (value as num).toDouble();
    }
  }

  bool getBool(String key) {
    var value = this[key];
    if (value == null) {
      return false;
    } else {
      return value;
    }
  }

  Map getMap(String key) {
    var value = this[key];
    if (value == null) {
      return {};
    } else {
      return value;
    }
  }

  List getList(String key) {
    var value = this[key];
    if (value == null) {
      return [];
    } else {
      return value;
    }
  }
}
