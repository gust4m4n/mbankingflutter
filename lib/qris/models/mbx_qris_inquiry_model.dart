import '../../utils/all_utils.dart';

class MbxQRISInquiryModel {
  String merchant_name = '';
  String transaction_id = '';

  MbxQRISInquiryModel();

  MbxQRISInquiryModel.fromJason(Jason jason) {
    merchant_name = jason['merchant_name'].stringValue;
    transaction_id = jason['transaction_id'].stringValue;
  }
}
