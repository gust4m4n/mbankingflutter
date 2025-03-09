import '../../utils/all_utils.dart';

class MbxAccountModel {
  String account = '';
  int balance = 0;
  int id = 0;
  String name = '';
  bool sof = false;
  bool visible = false;

  MbxAccountModel();

  MbxAccountModel.fromJason(Jason jason) {
    account = jason['account'].stringValue;
    balance = jason['balance'].intValue;
    id = jason['id'].intValue;
    name = jason['name'].stringValue;
    sof = jason['sof'].boolValue;
  }

  Map<String, dynamic> encode() {
    Map<String, dynamic> map = {};
    map['account'] = account;
    map['balance'] = balance;
    map['id'] = id;
    map['name'] = name;
    map['sof'] = sof;
    return map;
  }
}
