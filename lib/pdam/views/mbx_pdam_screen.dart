import 'package:mbankingflutter/sof/views/mbx_sof_widget.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_pdam_controller.dart';

class MbxPDAMScreen extends StatelessWidget {
  MbxPDAMScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPDAMController>(
        init: MbxPDAMController(),
        builder: (controller) => MbxScreen(
            title: 'PDAM',
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
                        'WILAYAH',
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
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextX(
                                    controller.areaSelected.id.isNotEmpty
                                        ? controller.areaSelected.name
                                        : '-',
                                    color: ColorX.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
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
                                  controller.btnAreaClicked();
                                })
                          ])),
                    ],
                  ),
                  error: controller.areaError,
                ),
                ContainerX(height: 12.0),
                ContainerError(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'NO. PELANGGAN',
                        color: ColorX.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: 'xxxxxxxxxxxxxxxxx',
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
                  title: 'Lanjut',
                  disabledBackgroundColor: ColorX.theme.withOpacity(0.1),
                  enabled: controller.readyToSubmit(),
                  clicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ],
            )));
  }
}
