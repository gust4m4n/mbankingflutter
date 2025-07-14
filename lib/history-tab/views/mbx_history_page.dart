import 'package:mbxflutter/receipt/models/mbx_receipt_model.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_history_controller.dart';
import 'mbx_history_widget.dart';

class MbxHistoryPage extends StatelessWidget {
  MbxHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHistoryController>(
      init: MbxHistoryController(),
      builder: (controller) => MbxScreen(
        backButtonHidden: true,
        title: 'Riwayat',
        curvedBody: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (controller.historyListVM.loading == false &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              controller.nextPage();
            }
            return true;
          },
          child: Scrollbar(
            controller: controller.scrollController,
            child: ListView.separated(
              controller: controller.scrollController,
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(Get.context!).padding.bottom + 100.0,
              ),
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 50.0),
                  child: ContainerX(
                    height: 0.5,
                    width: double.infinity,
                    backgroundColor: ColorX.lightGray,
                  ),
                );
              },
              itemCount: controller.historyListVM.list.length,
              itemBuilder: (context, index) {
                final history = controller.historyListVM.list[index];
                return InkWellX(
                  highlightColor: ColorX.theme.withOpacity(0.1),
                  clicked: () {
                    Get.toNamed(
                      '/receipt',
                      arguments: {
                        'receipt': MbxReceiptModel(),
                        'backToHome': false,
                      },
                    );
                  },
                  child: MbxHistoryWidget(history),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
