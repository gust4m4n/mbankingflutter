import 'package:mbankingflutter/sof/views/mbx_sof_widget.dart';

import '../widgets/all_widgets.dart';
import 'mbx_electricity_prepaid_controller.dart';
import 'mbx_electricity_prepaid_denom_widget.dart';

class MbxElectricityPrepaidScreen extends StatelessWidget {
  MbxElectricityPrepaidScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxElectricityPrepaidController>(
        init: MbxElectricityPrepaidController(),
        builder: (controller) => MbxScreen(
            title: 'Listrik Prabayar',
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
                ContainerError(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'ID Pelanggan',
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
                ContainerX(height: 12.0),
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  itemCount: controller.denomsVM.list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 4.0,
                    crossAxisSpacing: 4.0,
                    childAspectRatio: 2.0,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MbxElectricityPrepaidDenomWidget(
                      nominal: controller.denomsVM.list[index].nominal,
                      selected: controller.denomsVM.list[index].nominal ==
                          controller.denom,
                      clicked: () {
                        controller.selectDenom(
                            controller.denomsVM.list[index].nominal);
                      },
                    );
                  },
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
            )));
  }
}
