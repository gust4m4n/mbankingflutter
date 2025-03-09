import '../widgets/all_widgets.dart';
import 'mbx_transfer_controller.dart';
import 'mbx_transfer_history_widget.dart';

class MbxTransferScreen extends StatelessWidget {
  MbxTransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferController>(
        init: MbxTransferController(),
        builder: (controller) => MbxScreen(
              title: 'Transfer',
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContainerX(
                    padding: EdgeInsets.all(16.0),
                    child: Row(children: [
                      Expanded(
                        child: InkWellX(
                          child: ContainerX(
                              borderWidth: 1.0,
                              borderColor: ColorX.white,
                              padding: EdgeInsets.only(
                                  left: 16.0,
                                  top: 12.0,
                                  right: 16.0,
                                  bottom: 12.0),
                              cornerRadius: 16.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ImageX(
                                    faIcon:
                                        FontAwesomeIcons.arrowRightArrowLeft,
                                    color: ColorX.white,
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                  ContainerX(height: 4.0),
                                  TextX(
                                    'Antar Rekening',
                                    color: ColorX.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              )),
                          clicked: () {
                            controller.btnP2PClicked();
                          },
                        ),
                      ),
                      ContainerX(width: 8.0),
                      Expanded(
                        child: InkWellX(
                          child: ContainerX(
                              borderWidth: 1.0,
                              borderColor: ColorX.white,
                              padding: EdgeInsets.only(
                                  left: 16.0,
                                  top: 12.0,
                                  right: 16.0,
                                  bottom: 12.0),
                              cornerRadius: 16.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ImageX(
                                    faIcon: FontAwesomeIcons.buildingColumns,
                                    color: ColorX.white,
                                    width: 16.0,
                                    height: 16.0,
                                  ),
                                  ContainerX(height: 4.0),
                                  TextX(
                                    'Antar Bank',
                                    color: ColorX.white,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ],
                              )),
                          clicked: () {
                            controller.btnP2BankClicked();
                          },
                        ),
                      ),
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 0.0, right: 16.0, bottom: 4.0),
                    child: TextX(
                      'RIWAYAT',
                      color: ColorX.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                      child: ContainerX(
                          padding: EdgeInsets.only(
                              left: 16.0,
                              top: 0.0,
                              right: 16.0,
                              bottom: 16.0 +
                                  MediaQuery.of(Get.context!).padding.bottom),
                          child: ContainerX(
                              backgroundColor: ColorX.white,
                              cornerRadius: 16.0,
                              borderWidth: 0.5,
                              borderColor: ColorX.gray,
                              padding: EdgeInsets.only(
                                  left: 0.0,
                                  top: 16.0,
                                  right: 0.0,
                                  bottom: 16.0),
                              child: controller.loading == true
                                  ? Center(
                                      child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorX.gray)),
                                    )
                                  : NotificationListener<ScrollNotification>(
                                      onNotification:
                                          (ScrollNotification scrollInfo) {
                                        if (controller.historyListVM.loading ==
                                                false &&
                                            scrollInfo.metrics.pixels ==
                                                scrollInfo
                                                    .metrics.maxScrollExtent) {
                                          controller.nextPage();
                                        }
                                        return true;
                                      },
                                      child: Scrollbar(
                                          controller:
                                              controller.scrollController,
                                          child: ListView.separated(
                                              controller:
                                                  controller.scrollController,
                                              padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(
                                                              Get.context!)
                                                          .padding
                                                          .bottom +
                                                      100.0),
                                              physics: ClampingScrollPhysics(),
                                              separatorBuilder:
                                                  (context, index) {
                                                return Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 12.0),
                                                    child: ContainerX(
                                                      height: 0.5,
                                                      width: double.infinity,
                                                      backgroundColor:
                                                          ColorX.lightGray,
                                                    ));
                                              },
                                              itemCount: controller
                                                  .historyListVM.list.length,
                                              itemBuilder: (context, index) {
                                                if (index ==
                                                    controller.historyListVM
                                                            .list.length -
                                                        1) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 0), () {
                                                    controller.nextPage();
                                                  });
                                                }
                                                final history = controller
                                                    .historyListVM.list[index];
                                                return InkWellX(
                                                    highlightColor: ColorX.theme
                                                        .withOpacity(0.1),
                                                    clicked: () {
                                                      controller
                                                          .openHistory(history);
                                                    },
                                                    child:
                                                        MbxTransferHistoryWidget(
                                                      history: history,
                                                      onTransferClicked: () {
                                                        controller
                                                            .onTransferClicked(
                                                                history);
                                                      },
                                                    ));
                                              })),
                                    ))))
                ],
              ),
            ));
  }
}
