import '../../preferences/mbx_preferences_vm_users.dart';
import '../../widget-x/all_widgets.dart';
import '../views/mbx_language_controller.dart';
import 'mbx_language_widget.dart';

// ignore: must_be_immutable
class MbxLanguageSheet extends GetWidget<MbxLanguageController> {
  const MbxLanguageSheet({super.key});

  static Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxLanguageSheet();
    return SheetX.showCustom(widget: sheet, title: 'select_language'.tr);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxLanguageController>(
      init: MbxLanguageController(),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            physics: ClampingScrollPhysics(),
            itemCount: MbxUserPreferencesVM.supportedLanguages.length,
            separatorBuilder: (context, index) => SizedBox(height: 8.0),
            itemBuilder: (context, index) {
              final language = MbxUserPreferencesVM.supportedLanguages[index];
              final languageCode = language['code']!;
              final languageName = language['name']!;
              final languageFlag = language['flag']!;

              return Obx(
                () => MbxLanguageWidget(
                  flag: languageFlag,
                  name: languageName,
                  isSelected: controller.isLanguageSelected(languageCode),
                  clicked: () async {
                    await controller.changeLanguage(languageCode);
                    Get.back(); // Auto dismiss setelah memilih bahasa
                  },
                ),
              );
            },
          ),
          ContainerX(height: 16.0),
        ],
      ),
    );
  }
}
