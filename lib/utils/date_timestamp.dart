import 'package:intl/intl.dart';

extension DateTimestamp on int {
  String formatTimestamp(String fmt) {
    final DateTime dt = DateTime.fromMillisecondsSinceEpoch(this);
    return DateFormat(fmt).format(dt);
  }
}
