import '../../utils/all_utils.dart';

class MbxLabelValueModel {
  String label = '';
  String value = '';
  bool copyable = false;

  MbxLabelValueModel(Jason jason) {
    label = jason['label'].stringValue;
    value = jason['value'].stringValue;
    copyable = jason['copyable'].boolValue;
  }
}
