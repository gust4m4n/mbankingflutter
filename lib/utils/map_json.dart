import 'dart:convert';
import 'package:json_sorter/json_sorter.dart';

extension SafeJsonParsing on String {
  Map toJsonMap() {
    try {
      var map = json.decode(this);
      var sorted = jsonSortedEncode(map);
      map = json.decode(sorted);
      if (map == null) {
        return {};
      } else {
        return map;
      }
    } catch (e) {
      return {};
    }
  }

  List<Map> toJsonMapList() {
    try {
      List<Map<String, dynamic>>? list = (json.decode(this) as List)
          .map((e) => (e as Map<String, dynamic>).toSortedJsonMap())
          .cast<Map<String, dynamic>>()
          .toList();
      return list;
    } catch (e) {
      return [];
    }
  }
}

extension SafeJsonEncoder on Map {
  String toJsonString() {
    return json.encode(this);
  }

  Map toSortedJsonMap() {
    return toJsonString().toJsonMap();
  }
}

extension SafeJsonListEncoder on List<Map> {
  String toJsonString() {
    return json.encode(this);
  }
}
