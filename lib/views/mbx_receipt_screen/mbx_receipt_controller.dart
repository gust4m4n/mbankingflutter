import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../models/mbx_receipt_model.dart';
import '../../viewmodels/mbx_receipt_vm.dart';
import '../../widgets/all_widgets.dart';
import '../appx_feedback_sheet/appx_feedback_sheet.dart';

export 'dart:io';

export 'package:path_provider/path_provider.dart';

class MbxReceiptController extends GetxController {
  var receipt = MbxReceiptModel();
  var backToHome = false;
  var loading = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onReady() {
    super.onReady();
    receipt = Get.arguments['receipt'] as MbxReceiptModel;
    backToHome = Get.arguments['backToHome'] as bool;
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

    Future.delayed(const Duration(milliseconds: 1500), () {
      AppxFeedbackSheet.show(feature: 'feature-id');
    });
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
        XFile.fromData(capturedImage!, mimeType: 'image/jpeg', name: filename)
            .saveTo(filename)
            .then((value) {});
      } else {
        Share.shareXFiles([
          XFile.fromData(capturedImage!, mimeType: 'image/jpeg', name: filename)
        ]);
      }
    }).catchError((onError) {});
  }

  btnDownloadClicked() async {
    final filename = 'RECEIPT-${receipt.transaction_id}.JPG';
    screenshotController
        .capture(delay: Duration(milliseconds: 0))
        .then((capturedImage) async {
      if (kIsWeb) {
        XFile.fromData(capturedImage!, mimeType: 'image/jpeg', name: filename)
            .saveTo(filename)
            .then((value) {});
      } else {
        await ImageGallerySaver.saveImage(capturedImage!);
        ToastX.showSuccess(msg: 'Resi telah disimpan ke gallery.');
      }
    }).catchError((onError) {});
  }
}
