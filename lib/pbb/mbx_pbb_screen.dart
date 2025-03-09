import 'package:mbankingflutter/sof/views/mbx_sof_widget.dart';

import '../widgets/all_widgets.dart';
import 'mbx_pbb_controller.dart';

class MbxPBBScreen extends StatelessWidget {
  MbxPBBScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPBBController>(
        init: MbxPBBController(),
        builder: (controller) => MbxScreen(
            title: 'PBB',
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
                        'NO. OBJEK PAJAK',
                        color: ColorX.black,
                        fontSize: 13.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      ContainerX(height: 4.0),
                      TextFieldX(
                        hint: 'xxxxxxxxxxxxxxx',
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        readOnly: false,
                        controller: controller.nopController,
                        focusNode: controller.nopNode,
                        onChanged: (value) {
                          controller.nopChanged(value);
                        },
                      ),
                    ],
                  ),
                  error: controller.nopError,
                ),
                ContainerX(height: 12.0),
                ContainerError(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'TAHUN',
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
                                    controller.yearSelected.isNotEmpty
                                        ? controller.yearSelected
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
                                  controller.btnPickYearClicked();
                                })
                          ])),
                    ],
                  ),
                  error: controller.yearError,
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
