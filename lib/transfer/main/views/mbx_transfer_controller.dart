import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';
import 'package:mbxflutter/transfer/main/viewmodels/mbx_transfer_history_list_vm.dart';
import 'package:mbxflutter/transfer/main/viewmodels/mbx_transfer_history_model.dart';

class MbxTransferController extends GetxController {
  final scrollController = ScrollController();
  var historyListVM = MbxTransferHistoryListVM();
  var loading = true;

  @override
  void onReady() {
    super.onReady();
    update();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  btnP2PClicked() {
    Get.toNamed('/transfer/p2p');
  }

  btnP2BankClicked() {
    Get.toNamed('/transfer/p2bank');
  }

  nextPage() {
    if (historyListVM.loading) return;
    historyListVM.nextPage().then((resp) {
      loading = false;
      update();
    });
  }

  openHistory(MbxTransferHistoryModel dest) {
    Get.toNamed(
      '/receipt',
      arguments: {'receipt': MbxReceiptModel(), 'backToHome': false},
    );
  }

  onTransferClicked(MbxTransferHistoryModel history) {
    Get.toNamed('/transfer/p2p');
  }
}
