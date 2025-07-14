import 'package:mbxflutter/sof/views/mbx_sof_widget.dart';

import '../../../widget-x/all_widgets.dart';
import 'mbx_electricity_nontaglis_controller.dart';

class MbxElectricityNonTagLisScreen extends StatelessWidget {
  MbxElectricityNonTagLisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxElectricityNonTagLisController>(
      init: MbxElectricityNonTagLisController(),
      builder: (controller) => MbxScreen(
        title: 'Non-Tagihan Listrik',
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            ContainerError(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'Nomor Registrasi',
                    color: ColorX.black,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                  ),
                  ContainerX(height: 4.0),
                  TextFieldX(
                    hint: '0000000000',
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    controller: controller.customerIdController,
                    focusNode: controller.customerIdNode,
                    onChanged: (value) {
                      controller.customerIdChanged(value);
                    },
                  ),
                ],
              ),
              error: controller.customerIdError,
            ),
            ContainerX(height: 16.0),
            ButtonX(
              backgroundColor: ColorX.theme,
              disabledBackgroundColor: ColorX.theme.withOpacity(0.1),
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
