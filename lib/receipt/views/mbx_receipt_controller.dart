import 'package:mbxflutter/feedback/views/mbx_feedback_sheet.dart';
import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';
import 'package:mbxflutter/receipt/viewmodels/mbx_receipt_vm.dart';

import '../../widget-x/all_widgets.dart';

export 'dart:io';

export 'package:path_provider/path_provider.dart';

class MbxReceiptController extends GetxController {
  var receipt = MbxReceiptModel();
  var backToHome = false;
  var askFeedback = false;
  var loading = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onReady() {
    super.onReady();
    receipt = Get.arguments['receipt'] as MbxReceiptModel;
    backToHome = Get.arguments['backToHome'] as bool;
    askFeedback = (Get.arguments['askFeedback'] ?? false) as bool;
    update();
    if (receipt.transaction_id.isEmpty) {
      loading = true;
      update();
      final receiptVM = MbxReceiptVM();
      receiptVM.request(transaction_i: receipt.transaction_id).then((resp) {
        receipt = receiptVM.receipt;
        loading = false;
        update();
      });
    }

    if (askFeedback) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        MbxFeedbackSheet.show(feature: 'feature-id');
      });
    }
  }

  btnBackClicked() async {
    if (backToHome) {
      Get.offAllNamed('/home');
    } else {
      Get.back();
    }
  }

  btnShareClicked() {
    final filename = 'RECEIPT-${receipt.transaction_id}.JPG';
    screenshotController
        .capture(delay: Duration(milliseconds: 0))
        .then((capturedImage) async {
          if (kIsWeb) {
            XFile.fromData(
              capturedImage!,
              mimeType: 'image/jpeg',
              name: filename,
            ).saveTo(filename).then((value) {});
          } else {
            await Share.shareXFiles([
              XFile.fromData(
                capturedImage!,
                mimeType: 'image/jpeg',
                name: filename,
              ),
            ]);
          }
        })
        .catchError((onError) {});
  }

  btnDownloadClicked() async {
    final filename = 'RECEIPT-${receipt.transaction_id}.JPG';
    screenshotController
        .capture(delay: Duration(milliseconds: 0))
        .then((capturedImage) async {
          if (kIsWeb) {
            XFile.fromData(
              capturedImage!,
              mimeType: 'image/jpeg',
              name: filename,
            ).saveTo(filename).then((value) {});
          } else {
            ToastX.showSuccess(msg: 'Resi telah disimpan ke gallery.');
          }
        })
        .catchError((onError) {});
  }
}
