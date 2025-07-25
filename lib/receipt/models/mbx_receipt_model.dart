import '../../utils/all_utils.dart';
import 'mbx_label_value_model.dart';

class MbxReceiptModel {
  String amount = '';
  List<MbxLabelValueModel> details = [];
  String title = '';
  String transactionId = '';

  MbxReceiptModel();

  MbxReceiptModel.fromJason(Jason jason) {
    amount = jason['amount'].stringValue;
    for (final item in jason['details'].jasonListValue) {
      final detail = MbxLabelValueModel(item);
      details.add(detail);
    }
    title = jason['title'].stringValue;
    transactionId = jason['transaction_id'].stringValue;
  }
}
