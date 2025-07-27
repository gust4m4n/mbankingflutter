import '../../preferences/mbx_preferences_vm_users.dart';
import '../../widget-x/all_widgets.dart';
import '../controllers/mbx_theme_controller.dart';

// ignore: must_be_immutable
class MbxThemeWidget extends StatelessWidget {
  final Color color;

  const MbxThemeWidget({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxThemeController>(
      builder: (themeController) => ContainerX(
        child: Center(
          child: InkWellX(
            cornerRadius: 29.0,
            highlightColor: ColorX.highlight,
            clicked: () async {
              final hex =
                  '#${color.toARGB32().toRadixString(16).padLeft(8, '0')}';

              // Save theme and update ColorX.theme immediately
              await MbxUserPreferencesVM.setTheme(hex);
              ColorX.theme = hexToColor(hex);

              // Notify theme controller to update UI
              try {
                final themeController = Get.find<MbxThemeController>();
                themeController.notifyThemeColorChanged(hex);
              } catch (e) {
                // Fallback if controller not found
                Get.forceAppUpdate();
              }

              print('🎨 Theme color changed to: $hex');

              // Don't close the sheet - let user see the change and choose more colors if needed
            },
            child: ContainerX(
              padding: EdgeInsets.all(4.0),
              cornerRadius: 29.0,
              borderWidth: 2.0,
              borderColor: color.toARGB32() == ColorX.theme.toARGB32()
                  ? ColorX.theme
                  : ColorX.transparent,
              shadowColor: color.toARGB32() == ColorX.theme.toARGB32()
                  ? ColorX.theme.withValues(alpha: 0.3)
                  : ColorX.transparent,
              shadowBlurRadius: color.toARGB32() == ColorX.theme.toARGB32()
                  ? 8.0
                  : 0.0,
              child: ContainerX(
                width: 50.0,
                height: 50.0,
                cornerRadius: 25.0,
                backgroundColor: color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
