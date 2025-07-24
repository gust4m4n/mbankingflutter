import 'package:mbxflutter/sof/views/mbx_sof_widget.dart';

import '../../../widget-x/all_widgets.dart';
import 'mbx_transfer_p2bank_controller.dart';

class MbxTransferP2BankScreen extends StatelessWidget {
  const MbxTransferP2BankScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransfeP2BankController>(
      init: MbxTransfeP2BankController(),
      builder: (controller) => MbxScreen(
        title: 'Transfer Antar Bank',
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerError(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'REKENING TUJUAN',
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  ContainerX(height: 4.0),
                  ContainerX(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                      right: 12.0,
                      bottom: 8.0,
                    ),
                    borderWidth: 1.0,
                    borderColor: ColorX.lightGray,
                    cornerRadius: 8.0,
                    child: Row(
                      children: [
                        controller.dest.bank_icon.isEmpty
                            ? ImageX(
                                faIcon: FontAwesomeIcons.solidUser,
                                backgroundColor: ColorX.transparent,
                                width: 50.0,
                                height: 50.0,
                                cornerRadius: 8.0,
                                borderWidth: 0.5,
                                borderColor: ColorX.gray,
                                padding: EdgeInsets.all(16.0),
                              )
                            : ImageX(
                                url: controller.dest.bank_icon,
                                backgroundColor: ColorX.transparent,
                                width: 50.0,
                                height: 50.0,
                                cornerRadius: 8.0,
                                borderWidth: 0.5,
                                borderColor: ColorX.gray,
                                fit: BoxFit.contain,
                              ),
                        ContainerX(width: 8.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextX(
                                controller.dest.name.isNotEmpty
                                    ? controller.dest.name
                                    : '-',
                                color: ColorX.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.start,
                              ),
                              TextX(
                                controller.dest.account.isNotEmpty
                                    ? controller.dest.account
                                    : '-',
                                color: ColorX.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                                textAlign: TextAlign.start,
                              ),
                              TextX(
                                controller.dest.account.isNotEmpty
                                    ? controller.dest.bank
                                    : '-',
                                color: ColorX.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                        ContainerX(width: 8.0),
                        ButtonX(
                          backgroundColor: ColorX.transparent,
                          faIcon: FontAwesomeIcons.chevronDown,
                          iconWidth: 16.0,
                          iconHeight: 16.0,
                          title: '',
                          width: 40.0,
                          height: 40.0,
                          borderWidth: 0.5,
                          borderColor: ColorX.gray,
                          clicked: () {
                            controller.btnPickDestinationClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              error: controller.destError,
            ),
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
                ],
              ),
              error: controller.amountError,
            ),
            ContainerX(height: 12.0),
            ContainerError(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'LAYANAN TRANSFER',
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  ContainerX(height: 4.0),
                  ContainerX(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 12.0,
                      top: 8.0,
                      right: 12.0,
                      bottom: 8.0,
                    ),
                    borderWidth: 1.0,
                    borderColor: ColorX.lightGray,
                    cornerRadius: 8.0,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextX(
                            controller.service.name.isNotEmpty
                                ? controller.service.name
                                : '-',
                            color: ColorX.black,
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                            textAlign: TextAlign.start,
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
                            controller.btnTransferServiceClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              error: controller.serviceError,
            ),
            ContainerX(height: 12.0),
            ContainerError(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'BERITA',
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  ContainerX(height: 4.0),
                  TextFieldX(
                    hint: 'Pesan untuk penerima transfer',
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    readOnly: false,
                    controller: controller.messageController,
                    focusNode: controller.messageNode,
                  ),
                ],
              ),
              error: controller.messageError,
            ),
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
                    left: 12.0,
                    top: 8.0,
                    right: 12.0,
                    bottom: 8.0,
                  ),
                  borderWidth: 1.0,
                  borderColor: ColorX.lightGray,
                  cornerRadius: 8.0,
                  child: Row(
                    children: [
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
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ContainerX(height: 12.0),
            TextX(
              'PERHATIAN',
              color: ColorX.black,
              fontSize: 13.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.start,
            ),
            ContainerX(height: 4.0),
            TextX(
              'Bank tidak bertanggung jawab atas segala kerugian yang disebabkan oleh kesalahan pengisian data.',
              color: ColorX.black,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.start,
              maxLines: 16,
            ),
            ContainerX(height: 16.0),
            ButtonX(
              backgroundColor: ColorX.theme,
              disabledBackgroundColor: ColorX.theme.withValues(alpha: 0.1),
              title: 'Lanjut',
              enabled: controller.readyToSubmit(),
              clicked: () {
                controller.btnNextClicked();
              },
            ),
          ],
        ),
      ),
    );
  }
}
