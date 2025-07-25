import '../../utils/all_utils.dart';

class MbxQRISInquiryModel {
  String merchantName = '';
  String transactionId = '';

  MbxQRISInquiryModel();

  MbxQRISInquiryModel.fromJason(Jason jason) {
    merchantName = jason['merchant_name'].stringValue;
    transactionId = jason['transaction_id'].stringValue;
  }
}
