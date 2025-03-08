import '../../models/mbx_qris_inquiry_model.dart';
import '../../widgets/all_widgets.dart';
import '../mbx_sof_sheet/mbx_sof_widget.dart';
import 'mbx_qris_amount_controller.dart';

class MbxQRISAmountScreen extends StatelessWidget {
  final MbxQRISInquiryModel inquiry;
  MbxQRISAmountScreen({required this.inquiry});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxQRISAmountController>(
        init: MbxQRISAmountController(inquiry: inquiry),
        builder: (controller) => MbxScreen(
            title: 'QRIS',
            scrollingBody:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextX(
                'PEMBAYARAN KEPADA',
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: ColorX.black,
              ),
              ContainerX(height: 4.0),
              ContainerX(
                  width: double.infinity,
                  backgroundColor: ColorX.theme,
                  borderWidth: 1.0,
                  borderColor: ColorX.lightGray,
                  cornerRadius: 12.0,
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextX(
                        inquiry.merchant_name,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.center,
                        color: ColorX.white,
                        maxLines: 8,
                      ),
                      TextX(
                        'No. Transaksi: ${inquiry.transaction_id}',
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        color: ColorX.white,
                        maxLines: 8,
                      ),
                    ],
                  )),
              ContainerX(height: 12.0),
              ContainerError(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextX(
                          'JUMLAH',
                          color: ColorX.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                        ),
                        ContainerX(height: 4.0),
                        TextFieldX(
                          hint: 'Nominal transfer',
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          readOnly: false,
                          controller: controller.amountController,
                          focusNode: controller.amountNode,
                          onChanged: (value) {
                            controller.txtAmountChanged(value);
                          },
                        ),
                      ]),
                  error: controller.amountError),
              ContainerX(height: 12.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'SUMBER DANA',
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  ContainerX(height: 4.0),
                  ContainerX(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                          left: 12.0, top: 8.0, right: 12.0, bottom: 8.0),
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      cornerRadius: 8.0,
                      child: Row(children: [
                        Expanded(
                          child: MbxSofWidget(
                            account: controller.sof,
                            borders: false,
                            onEyeClicked: () {
                              controller.btnSofEyeClicked();
                            },
                          ),
                        ),
                        ContainerX(width: 8.0),
                        ButtonX(
                            faIcon: FontAwesomeIcons.chevronDown,
                            backgroundColor: ColorX.transparent,
                            iconWidth: 16.0,
                            iconHeight: 16.0,
                            title: '',
                            width: 40.0,
                            height: 40.0,
                            borderWidth: 0.5,
                            borderColor: ColorX.gray,
                            clicked: () {
                              controller.btnSofClicked();
                            })
                      ])),
                ],
              ),
              ContainerX(height: 12.0),
              ButtonX(
                title: 'Lanjut',
                backgroundColor: ColorX.theme,
                disabledBackgroundColor: ColorX.theme.withOpacity(0.2),
                enabled: controller.amount > 0,
                clicked: () {
                  controller.btnNextClicked();
                },
              )
            ])));
  }
}
