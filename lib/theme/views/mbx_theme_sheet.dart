import 'package:mbxflutter/theme/controllers/mbx_theme_controller.dart';
import 'package:mbxflutter/theme/viewmodels/mbx_theme_vm.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_theme_controller.dart';
import 'mbx_theme_widget.dart';

// ignore: must_be_immutable
class MbxThemeSheet extends GetWidget<MbxThemeViewController> {
  const MbxThemeSheet({super.key});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return Get.bottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      ignoreSafeArea: true,
      elevation: 0.0,
      GetBuilder<MbxThemeController>(
        init: Get.find<MbxThemeController>(),
        builder: (themeController) => ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(Get.context!).size.height -
                (MediaQuery.of(Get.context!).padding.top),
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: ContainerX(
              backgroundColor: ColorX.transparent,
              padding: EdgeInsets.only(
                left: 16.0,
                top: 16.0,
                right: 16.0,
                bottom: 16.0 + MediaQuery.of(Get.context!).padding.bottom,
              ),
              child: ContainerX(
                backgroundColor: ColorX.white,
                cornerRadius: 16.0,
                child: Wrap(
                  children: [
                    // Custom titlebar yang reaktif
                    ContainerX(
                      padding: EdgeInsets.all(16.0),
                      child: ContainerX(
                        height: 40.0,
                        child: Row(
                          children: [
                            InkWellX(
                              cornerRadius: 20.0,
                              clicked: () {
                                Get.back();
                              },
                              child: ContainerX(
                                width: 40.0,
                                height: double.infinity,
                                child: Center(
                                  child: ImageX(
                                    backgroundColor: ColorX.lightGray
                                        .withValues(alpha: 0.3),
                                    faIcon: FontAwesomeIcons.xmark,
                                    color: ColorX.black,
                                    width: 32.0,
                                    height: 32.0,
                                    cornerRadius: 20.0,
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                ),
                              ),
                            ),
                            ContainerX(width: 8.0),
                            Expanded(
                              child: TextX(
                                'Pilih Theme',
                                color: ColorX.black,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            ContainerX(width: 8.0),
                            ContainerX(width: 40.0), // Spacer for balance
                          ],
                        ),
                      ),
                    ),
                    // Content
                    this,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxThemeViewController>(
      init: MbxThemeViewController(),
      builder: (controller) => GetBuilder<MbxThemeController>(
        init: Get.find<MbxThemeController>(),
        builder: (themeController) => ContainerX(
          backgroundColor: ColorX.white, // Dynamic background color
          child: Wrap(
            children: [
              // Dark Mode Toggle Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                decoration: BoxDecoration(
                  color: ColorX.white, // Dynamic background
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          themeController.isDarkMode
                              ? Icons.dark_mode
                              : Icons.light_mode,
                          color: ColorX.black,
                          size: 24.0,
                        ),
                        const SizedBox(width: 12.0),
                        TextX(
                          'Dark Mode',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: ColorX.black,
                        ),
                      ],
                    ),
                    Switch(
                      value: themeController.isDarkMode,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      },
                      activeTrackColor: ColorX.lightGray,
                      activeColor: ColorX.theme,
                      inactiveTrackColor: ColorX.lightGray,
                      inactiveThumbColor: ColorX.gray,
                      trackOutlineColor:
                          WidgetStateProperty.resolveWith<Color?>(
                            (_) => ColorX.transparent,
                          ),
                      trackOutlineWidth:
                          WidgetStateProperty.resolveWith<double?>((_) => 0.0),
                    ),
                  ],
                ),
              ),

              // Divider
              Container(
                height: 1.0,
                color: ColorX.lightGray,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
              ),

              const SizedBox(height: 16.0),

              // Theme Colors Grid
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Container(
                      width: 4.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: ColorX.theme,
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    const SizedBox(width: 12.0),
                    TextX(
                      'Pilih Warna Tema',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                      color: ColorX.black,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),

              Container(
                decoration: BoxDecoration(
                  color: ColorX.white,
                  border: Border.all(
                    color: ColorX.theme.withValues(alpha: 0.2),
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(12.0),
                  physics: ClampingScrollPhysics(),
                  itemCount: MbxThemeVM.colors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1.0,
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return MbxThemeWidget(color: MbxThemeVM.colors[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
