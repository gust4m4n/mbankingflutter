import '../widgets/all_widgets.dart';
import 'mbx_cardless_payment_controller.dart';

class MbxCardlessPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxCardlessPaymentController>(
        init: MbxCardlessPaymentController(),
        builder: (controller) => MbxScreen(
            title: 'Tarik Tunai',
            backAction: () {
              controller.btnBackClicked();
            },
            scrollingBody: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  'Ikuti instruksi di bawah ini untuk melakukan penarikan tunai di ATM.',
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 16,
                ),
                ContainerX(height: 12.0),
                ListView.builder(
                    physics: ClampingScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: controller.steps.length,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
                          child: Row(
                            children: [
                              ContainerX(
                                width: 32.0,
                                height: 32.0,
                                cornerRadius: 16.0,
                                borderWidth: 1.0,
                                borderColor: ColorX.black,
                                child: Center(
                                  child: TextX(
                                    '${controller.steps[index].no}',
                                    color: ColorX.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.start,
                                    maxLines: 16,
                                  ),
                                ),
                              ),
                              ContainerX(width: 8.0),
                              Expanded(
                                child: TextX(
                                  controller.steps[index].message,
                                  color: ColorX.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.start,
                                  maxLines: 16,
                                ),
                              ),
                            ],
                          ));
                    }),
                ContainerX(height: 16.0),
                ButtonX(
                  backgroundColor: ColorX.theme,
                  title: 'Selesai',
                  clicked: () {
                    controller.btnBackClicked();
                  },
                ),
              ],
            )));
  }
}
