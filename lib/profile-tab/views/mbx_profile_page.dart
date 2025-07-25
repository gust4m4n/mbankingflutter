import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_profile_controller.dart';
import 'mbx_profile_menu_button.dart';

class MbxProfilePage extends StatelessWidget {
  const MbxProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxProfileController>(
      init: MbxProfileController(),
      builder: (controller) => MbxScreen(
        navigationBarHidden: true,
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              ContainerX(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ContainerX(height: MediaQuery.of(Get.context!).padding.top),
                    ContainerX(
                      child: Center(
                        child: Stack(
                          children: [
                            ImageX(
                              faIcon: MbxProfileVM.profile.photo.isEmpty
                                  ? FontAwesomeIcons.user
                                  : null,
                              url: MbxProfileVM.profile.photo,
                              color: MbxProfileVM.profile.photo.isEmpty
                                  ? ColorX.gray
                                  : null,
                              width: 100.0,
                              height: 100.0,
                              cornerRadius: 50.0,
                              borderWidth: 4.0,
                              borderColor: ColorX.white,
                            ),
                            Positioned(
                              right: 0.0,
                              bottom: 0.0,
                              child: ButtonX(
                                title: '',
                                clicked: () {
                                  controller.btnChangeAvatarClicked();
                                },
                                backgroundColor: ColorX.white,
                                borderColor: ColorX.white,
                                borderWidth: 2.0,
                                faIcon: FontAwesomeIcons.plus,
                                faColor: ColorX.theme,
                                iconWidth: 16.0,
                                iconHeight: 16.0,
                                width: 28.0,
                                height: 28.0,
                                cornerRadius: 14.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      MbxProfileVM.profile.name.isEmpty
                          ? '-'
                          : MbxProfileVM.profile.name,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      color: ColorX.white,
                    ),
                    ContainerX(height: 2.0),
                    TextX(
                      MbxProfileVM.profile.phone.isEmpty
                          ? '-'
                          : MbxProfileVM.profile.phone,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ContainerX(
                  backgroundColor: ColorX.white,
                  cornerRadius: 16.0,
                  borderWidth: 0.5,
                  borderColor: ColorX.gray,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Column(
                    children: [
                      MbaxProfileMenuButton(
                        title: 'biometricActivation'.tr,
                        faIcon: FontAwesomeIcons.fingerprint,
                        clicked: () {},
                        toggle: true,
                        toggleValue: controller.biometricEnabled,
                        onToggleChanged: (value) {
                          controller.biometricEnabled = value;
                          controller.toggleBiometric(value);
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'changePin'.tr,
                        faIcon: FontAwesomeIcons.key,
                        clicked: () {
                          controller.btnChangePinClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'terms_and_conditions'.tr,
                        faIcon: FontAwesomeIcons.shieldHalved,
                        clicked: () {
                          controller.btnTncClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'privacy_policy'.tr,
                        faIcon: FontAwesomeIcons.userShield,
                        clicked: () {
                          controller.btnPrivacyPolicyClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'faq'.tr,
                        faIcon: FontAwesomeIcons.circleQuestion,
                        clicked: () {
                          controller.btnFaqClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'language'.tr,
                        faIcon: FontAwesomeIcons.globe,
                        clicked: () {
                          controller.btnLanguageClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'help'.tr,
                        faIcon: FontAwesomeIcons.headset,
                        clicked: () {
                          controller.btnHelpClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'logout'.tr,
                        faIcon: FontAwesomeIcons.powerOff,
                        clicked: () {
                          controller.btnLogoutClicked();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 32.0, right: 32.0),
                child: TextX(
                  controller.version,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  color: ColorX.gray,
                ),
              ),
              ContainerX(
                height:
                    MediaQuery.of(Get.context!).padding.bottom +
                    60.0 +
                    30.0 +
                    16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
