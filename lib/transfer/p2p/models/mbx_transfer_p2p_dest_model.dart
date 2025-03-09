import '../../../utils/all_utils.dart';

class MbxTransferP2PDestModel {
  String name = '';
  String account = '';

  MbxTransferP2PDestModel();

  MbxTransferP2PDestModel.fromJason(Jason jason) {
    name = jason['name'].stringValue;
    account = jason['account'].stringValue;
  }
}
