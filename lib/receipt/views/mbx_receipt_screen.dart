import '../../widget-x/all_widgets.dart';
import 'mbx_receipt_controller.dart';
import 'mbx_receipt_widget.dart';

class MbxReceiptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxReceiptController>(
      init: MbxReceiptController(),
      builder: (controller) => MbxScreen(
          backAction: () {
            controller.btnBackClicked();
          },
          body: ContainerX(
              child: controller.loading
                  ? Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(ColorX.white)),
                    )
                  : Scrollbar(
                      child: SingleChildScrollView(
                          physics: ClampingScrollPhysics(),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Screenshot(
                                    controller: controller.screenshotController,
                                    child: ContainerX(
                                        gradientColorBegin: ColorX.theme,
                                        gradientColorEnd: ColorX.white,
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            top: 16.0,
                                            right: 16.0,
                                            bottom: 16.0),
                                        child: Container(
                                            padding: EdgeInsets.all(32.0),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/mbx_sticker.png'),
                                                  repeat: ImageRepeat.repeat,
                                                ),
                                                border: Border.all(
                                                    color: ColorX.gray,
                                                    width: 0.5),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16.0))),
                                            child: Column(children: [
                                              Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    ImageX(
                                                      url:
                                                          'assets/images/mbx_logo.png',
                                                      width: 34.0,
                                                      height: 34.0,
                                                    ),
                                                    TextX(
                                                      'Bank XYZ',
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: ColorX.black,
                                                    ),
                                                  ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 4.0,
                                                      right: 0.0,
                                                      bottom: 4.0),
                                                  child: DashedDividerX(
                                                      dashColor: ColorX.gray,
                                                      dashWidth: 6.0,
                                                      dashHeight: 1.0)),
                                              Column(children: [
                                                ContainerX(height: 8.0),
                                                ContainerX(
                                                  padding: EdgeInsets.all(4.0),
                                                  borderWidth: 2.0,
                                                  borderColor: ColorX.green,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  cornerRadius: 25.0,
                                                  child: Center(
                                                      child: ImageX(
                                                    faIcon:
                                                        FontAwesomeIcons.check,
                                                    color: ColorX.white,
                                                    width: 40.0,
                                                    height: 40.0,
                                                    cornerRadius: 20.0,
                                                    backgroundColor:
                                                        ColorX.green,
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                  )),
                                                ),
                                                ContainerX(height: 4.0),
                                                TextX(
                                                  controller.receipt.title,
                                                  textAlign: TextAlign.center,
                                                  fontSize: 17.0,
                                                  fontWeight: FontWeight.w500,
                                                  maxLines: 8,
                                                ),
                                                TextX(
                                                  controller.receipt.amount,
                                                  textAlign: TextAlign.center,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.w600,
                                                  maxLines: 8,
                                                ),
                                              ]),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 0.0,
                                                      top: 4.0,
                                                      right: 0.0,
                                                      bottom: 4.0),
                                                  child: DashedDividerX(
                                                      dashColor: ColorX.gray,
                                                      dashWidth: 6.0,
                                                      dashHeight: 1.0)),
                                              ListView.builder(
                                                  shrinkWrap: true,
                                                  padding: EdgeInsets.zero,
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  itemCount: controller
                                                      .receipt.details.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final detail = controller
                                                        .receipt.details[index];
                                                    return MbxReceiptWidget(
                                                        detail);
                                                  }),
                                            ])))),
                                ContainerX(
                                    backgroundColor: ColorX.white,
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: Row(
                                      children: [
                                        ButtonX(
                                          faIcon: FontAwesomeIcons.shareNodes,
                                          iconWidth: 16.0,
                                          iconHeight: 16.0,
                                          title: '',
                                          backgroundColor: ColorX.transparent,
                                          borderWidth: 0.5,
                                          borderColor: ColorX.gray,
                                          width: 42.0,
                                          height: 42.0,
                                          cornerRadius: 8.0,
                                          clicked: controller.btnShareClicked,
                                        ),
                                        ContainerX(width: 8.0),
                                        ButtonX(
                                          faIcon: FontAwesomeIcons.download,
                                          iconWidth: 16.0,
                                          iconHeight: 16.0,
                                          title: '',
                                          backgroundColor: ColorX.transparent,
                                          borderWidth: 0.5,
                                          borderColor: ColorX.gray,
                                          width: 42.0,
                                          height: 42.0,
                                          cornerRadius: 8.0,
                                          clicked:
                                              controller.btnDownloadClicked,
                                        ),
                                        ContainerX(width: 8.0),
                                        Expanded(
                                          child: ButtonX(
                                            title: 'Selesai',
                                            backgroundColor: ColorX.theme,
                                            titleColor: ColorX.white,
                                            height: 42.0,
                                            cornerRadius: 8.0,
                                            clicked: controller.btnBackClicked,
                                          ),
                                        ),
                                      ],
                                    )),
                                ContainerX(
                                    backgroundColor: ColorX.white,
                                    height: 16.0 +
                                        MediaQuery.of(context).padding.bottom),
                              ]))))),
    );
  }
}
