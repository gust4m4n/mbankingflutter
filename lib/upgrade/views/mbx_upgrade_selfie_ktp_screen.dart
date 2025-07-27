import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_selfie_ktp_controller.dart';

class MbxUpgradeSelfieKtpScreen extends StatelessWidget {
  const MbxUpgradeSelfieKtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<MbxUpgradeSelfieKtpController>(
      init: MbxUpgradeSelfieKtpController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_selfie_ktp_title'.tr,
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerX(height: 24.0),

            // Progress indicator - step 2 of 6
            UpgradeLayoutHelper.buildProgressIndicator(2, 6),

            ContainerX(height: 32.0),

            // Step indicator
            UpgradeLayoutHelper.buildStepIndicator('upgrade_step_2_of_6'.tr),

            ContainerX(height: 8.0),

            // Title
            UpgradeLayoutHelper.buildHeader('upgrade_selfie_ktp_header'.tr),

            ContainerX(height: 16.0),

            // Description
            UpgradeLayoutHelper.buildDescription('upgrade_selfie_ktp_desc'.tr),
            ContainerX(height: 32.0),

            // Photo preview
            UpgradeLayoutHelper.buildPhotoPreview(
              photoWidget: controller.getPhotoWidget(),
              placeholderText: 'upgrade_no_photo'.tr,
              placeholderSubtext: 'upgrade_selfie_ktp_instruction'.tr,
              placeholderIcon: FontAwesomeIcons.userPlus,
              onTap: () {
                controller.showPhotoOptions();
              },
            ),

            ContainerX(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      title: 'upgrade_camera_btn'.tr,
                      backgroundColor: ColorX.theme,
                      titleColor: ColorX.white,
                      cornerRadius: 12.0,
                      height: 50.0,
                      clicked: () {
                        controller.btnCaptureClicked();
                      },
                    ),
                  ),
                  ContainerX(width: 12.0),
                  Expanded(
                    child: ButtonX(
                      title: 'upgrade_gallery_btn'.tr,
                      backgroundColor: ColorX.gray,
                      titleColor: ColorX.white,
                      cornerRadius: 12.0,
                      height: 50.0,
                      clicked: () {
                        controller.btnGalleryClicked();
                      },
                    ),
                  ),
                ],
              ),
            ),
            ContainerX(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonX(
                title: 'upgrade_continue_btn'.tr,
                backgroundColor: ColorX.green,
                titleColor: ColorX.white,
                cornerRadius: 12.0,
                height: 50.0,
                clicked: () {
                  controller.btnNextClicked();
                },
              ),
            ),
            ContainerX(height: 24.0),
          ],
        ),
      ),
    );
  }
}
