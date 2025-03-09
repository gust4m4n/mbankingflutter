import '../../utils/all_utils.dart';

class MbxPDAMAreaModel {
  String id = '';
  String name = '';

  MbxPDAMAreaModel();

  MbxPDAMAreaModel.fromJason(Jason jason) {
    id = jason['id'].stringValue;
    name = jason['name'].stringValue;
  }
}
