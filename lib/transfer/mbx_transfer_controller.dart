import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbankingflutter/models/mbx_transfer_history_model.dart';
import 'package:mbankingflutter/viewmodels/mbx_transfer_history_list_vm.dart';

import '../models/mbx_receipt_model.dart';

class MbxTransferController extends GetxController {
  final scrollController = ScrollController();
  var historyListVM = MbxTransferHistoryListVM();
  var loading = true;

  @override
  void onInit() {
    super.onInit();
  }

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
    Get.toNamed('/receipt',
        arguments: {'receipt': MbxReceiptModel(), 'backToHome': false});
  }

  onTransferClicked(MbxTransferHistoryModel history) {
    Get.toNamed('/transfer/p2p');
  }
}
