import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_ktp_photo_controller.dart';

class MbxUpgradeKtpPhotoScreen extends StatelessWidget {
  const MbxUpgradeKtpPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeKtpPhotoController>(
      init: MbxUpgradeKtpPhotoController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_ktp_photo_title'.tr,
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress indicator
            UpgradeLayoutHelper.buildProgressIndicator(3, 6),

            // Step indicator
            UpgradeLayoutHelper.buildStepIndicator('upgrade_step_3_of_6'.tr),

            // Title
            UpgradeLayoutHelper.buildHeader('upgrade_ktp_photo_header'.tr),

            // Description
            UpgradeLayoutHelper.buildDescription('upgrade_ktp_photo_desc'.tr),

            ContainerX(height: 32.0),

            // Photo preview
            UpgradeLayoutHelper.buildPhotoPreview(
              photoWidget: controller.getPhotoWidget(),
              placeholderText: 'upgrade_no_ktp'.tr,
              placeholderSubtext: 'upgrade_ktp_instruction'.tr,
              placeholderIcon: FontAwesomeIcons.idCard,
              height: 300.0, // Slightly smaller for KTP
            ),

            ContainerX(height: 32.0),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      faIcon: Icons.camera_alt,
                      title: 'upgrade_camera_btn'.tr,
                      clicked: controller.isLoading
                          ? null
                          : () {
                              controller.btnCaptureClicked();
                            },
                    ),
                  ),
                  ContainerX(width: 16.0),
                  Expanded(
                    child: ButtonX(
                      faIcon: Icons.photo_library,
                      title: "Galeri",
                      backgroundColor: Colors.grey[200]!,
                      titleColor: ColorX.black,
                      clicked: controller.isLoading
                          ? null
                          : () {
                              controller.btnGalleryClicked();
                            },
                    ),
                  ),
                ],
              ),
            ),

            ContainerX(height: 24.0),

            // Next button
            if (controller.hasPhoto)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ButtonX(
                  title: "Lanjutkan",
                  clicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ),

            ContainerX(height: 32.0),
          ],
        ),
      ),
    );
  }
}
