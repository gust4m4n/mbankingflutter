import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import '../../home-page/views/mbx_launcher_widget.dart';
import '../../home-page/views/mbx_theme_button.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_relogin_controller.dart';

class MbxReloginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxReloginController>(
        init: MbxReloginController(),
        builder: (controller) => MbxScreen(
              navigationBarHidden: true,
              body: ContainerX(
                  child: Column(
                children: [
                  ContainerX(height: MediaQuery.of(Get.context!).padding.top),
                  ContainerX(
                    padding: EdgeInsets.only(
                        left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                    child: Row(
                      children: [
                        Spacer(),
                        MbxThemeButton(
                          clicked: () {
                            controller.btnThemeClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ContainerX(
                        padding: EdgeInsets.all(16.0),
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.center,
                                children: [
                              ContainerX(
                                  backgroundColor: ColorX.white,
                                  padding: EdgeInsets.all(16.0),
                                  cornerRadius: 16.0,
                                  child: Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    alignment: WrapAlignment.center,
                                    children: [
                                      ContainerX(
                                          backgroundColor: ColorX.white,
                                          width: 110.0,
                                          height: 110.0,
                                          cornerRadius: 55.0,
                                          child: Center(
                                              child: ImageX(
                                            faIcon: MbxProfileVM
                                                    .profile.photo.isEmpty
                                                ? FontAwesomeIcons.user
                                                : null,
                                            color: MbxProfileVM
                                                    .profile.photo.isEmpty
                                                ? ColorX.gray
                                                : null,
                                            url: MbxProfileVM.profile.photo,
                                            width: MbxProfileVM
                                                    .profile.photo.isEmpty
                                                ? 50.0
                                                : 100.0,
                                            height: 100.0,
                                            cornerRadius: 50.0,
                                          ))),
                                      ContainerX(height: 8.0),
                                      TextX(
                                        MbxProfileVM.profile.name.isEmpty
                                            ? '-'
                                            : MbxProfileVM.profile.name,
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.w700,
                                        color: ColorX.black,
                                      ),
                                      ContainerX(height: 2.0),
                                      TextX(
                                        MbxProfileVM.profile.phone.isEmpty
                                            ? '-'
                                            : MbxProfileVM.profile.phone,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w400,
                                        color: ColorX.black,
                                      ),
                                      ContainerX(height: 12.0),
                                      ButtonX(
                                        backgroundColor: ColorX.theme,
                                        title: 'Masuk',
                                        clicked: () {
                                          controller.btnLoginClicked();
                                        },
                                      ),
                                      ContainerX(height: 12.0),
                                      ContainerX(
                                          height: 80.0,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MbxLauncherWidget(
                                                  color: ColorX.red,
                                                  faIcon:
                                                      FontAwesomeIcons.qrcode,
                                                  title: 'QRIS',
                                                  titleColor: ColorX.black,
                                                  highlightColor: ColorX.theme
                                                      .withOpacity(0.2),
                                                  clicked: () {
                                                    controller.btnQRISClicked();
                                                  }),
                                              MbxLauncherWidget(
                                                color: ColorX.blue,
                                                faIcon:
                                                    FontAwesomeIcons.sackDollar,
                                                title: 'Tarik Tunai',
                                                titleColor: ColorX.black,
                                                highlightColor: ColorX.theme
                                                    .withOpacity(0.2),
                                                clicked: () {
                                                  controller
                                                      .btnCardlessClicked();
                                                },
                                              ),
                                              MbxLauncherWidget(
                                                color: ColorX.green,
                                                faIcon:
                                                    FontAwesomeIcons.question,
                                                title: 'Bantuan',
                                                titleColor: ColorX.black,
                                                highlightColor: ColorX.theme
                                                    .withOpacity(0.2),
                                                clicked: () {
                                                  controller.btnHelpClicked();
                                                },
                                              ),
                                            ],
                                          )),
                                    ],
                                  )),
                              ContainerX(height: 16.0),
                              ButtonX(
                                width: 150.0,
                                backgroundColor: ColorX.transparent,
                                highlightColor: ColorX.theme.withOpacity(0.1),
                                title: 'Ganti Akun',
                                titleColor: ColorX.black,
                                clicked: () {
                                  controller.btnSwitchAccountClicked();
                                },
                              ),
                            ]))),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: TextX(
                      controller.version,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.white,
                    ),
                  ),
                ],
              )),
            ));
  }
}
