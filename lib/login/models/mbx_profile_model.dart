import '../../utils/all_utils.dart';
import 'mbx_account_model.dart';

class MbxProfileModel {
  List<MbxAccountModel> accounts = [];
  bool biometric = false;
  String email = '';
  String name = '';
  String phone = '';
  String photo = '';

  MbxProfileModel();

  decode(Jason jason) {
    accounts = [];
    for (final item in jason['accounts'].jasonListValue) {
      accounts.add(MbxAccountModel.fromJason(item));
    }
    biometric = jason['biometric'].boolValue;
    email = jason['email'].stringValue;
    name = jason['name'].stringValue;
    phone = jason['phone'].stringValue;
    photo = jason['photo'].stringValue;
  }

  Jason encode() {
    final jason = Jason();
    List<Map<String, dynamic>> accs = [];
    for (final item in accounts) {
      accs.add(item.encode());
    }
    jason['accounts'] = accs;
    jason['biometric'] = biometric;
    jason['email'] = email;
    jason['name'] = name;
    jason['phone'] = phone;
    jason['photo'] = photo;
    return jason;
  }
}
