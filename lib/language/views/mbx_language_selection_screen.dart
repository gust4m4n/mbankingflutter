import '../../preferences/mbx_preferences_vm_users.dart';
import '../../widget-x/all_widgets.dart';
import '../views/mbx_language_controller.dart';

class MbxLanguageSelectionScreen extends StatelessWidget {
  const MbxLanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MbxLanguageController>();

    return MbxScreen(
      navigationBarHidden: false,
      title: 'select_language'.tr,
      backAction: () {
        Get.back();
      },
      body: ContainerX(
        backgroundColor: ColorX.lightGray,
        child: Column(
          children: [
            ContainerX(height: 16.0),
            Expanded(
              child: ContainerX(
                backgroundColor: ColorX.white,
                topLeftRadius: 16.0,
                topRightRadius: 16.0,
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextX(
                      'select_language'.tr,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      'Choose your preferred language for the app',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.gray,
                    ),
                    ContainerX(height: 24.0),
                    Expanded(
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount:
                            MbxUserPreferencesVM.supportedLanguages.length,
                        itemBuilder: (context, index) {
                          final language =
                              MbxUserPreferencesVM.supportedLanguages[index];
                          final languageCode = language['code']!;
                          final languageName = language['name']!;
                          final languageFlag = language['flag']!;

                          return Obx(
                            () => ContainerX(
                              margin: const EdgeInsets.only(bottom: 12.0),
                              backgroundColor:
                                  controller.isLanguageSelected(languageCode)
                                  ? ColorX.theme.withValues(alpha: 0.1)
                                  : ColorX.white,
                              borderWidth:
                                  controller.isLanguageSelected(languageCode)
                                  ? 2.0
                                  : 1.0,
                              borderColor:
                                  controller.isLanguageSelected(languageCode)
                                  ? ColorX.theme
                                  : ColorX.lightGray,
                              cornerRadius: 12.0,
                              child: InkWellX(
                                clicked: () {
                                  controller.changeLanguage(languageCode);
                                },
                                child: ContainerX(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      TextX(languageFlag, fontSize: 24.0),
                                      ContainerX(width: 16.0),
                                      Expanded(
                                        child: TextX(
                                          languageName,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                          color: ColorX.black,
                                        ),
                                      ),
                                      if (controller.isLanguageSelected(
                                        languageCode,
                                      ))
                                        ImageX(
                                          faIcon: FontAwesomeIcons.check,
                                          color: ColorX.theme,
                                          width: 20.0,
                                          height: 20.0,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
