import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_selfie_controller.dart';

class MbxUpgradeSelfieScreen extends StatelessWidget {
  const MbxUpgradeSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSelfieController>(
      init: MbxUpgradeSelfieController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_take_selfie_title'.tr,
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerX(height: 24.0),

            // Progress indicator - step 1 of 6
            UpgradeLayoutHelper.buildProgressIndicator(1, 6),

            ContainerX(height: 32.0),

            // Step indicator
            UpgradeLayoutHelper.buildStepIndicator('upgrade_step_1_of_6'.tr),

            ContainerX(height: 8.0),

            // Title
            UpgradeLayoutHelper.buildHeader('upgrade_take_selfie_header'.tr),

            ContainerX(height: 8.0),

            // Subtitle
            UpgradeLayoutHelper.buildDescription(
              'upgrade_take_selfie_subtitle'.tr,
            ),

            ContainerX(height: 32.0),

            // Camera preview area or captured photo
            Obx(
              () => UpgradeLayoutHelper.buildPhotoPreview(
                photoWidget: controller.capturedPhoto.value != null
                    ? controller.buildPhotoWidget(
                        controller.capturedPhoto.value,
                      )
                    : null,
                placeholderText: 'upgrade_no_photo'.tr,
                placeholderSubtext: 'upgrade_tap_camera'.tr,
                placeholderIcon: FontAwesomeIcons.camera,
                onTap: () {
                  controller.showPhotoOptions();
                },
              ),
            ),

            ContainerX(height: 32.0),

            // Instructions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ContainerX(
                backgroundColor: ColorX.blue.withValues(alpha: 0.1),
                cornerRadius: 12.0,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageX(
                          faIcon: FontAwesomeIcons.lightbulb,
                          color: ColorX.blue,
                          width: 20.0,
                          height: 20.0,
                        ),
                        ContainerX(width: 8.0),
                        TextX(
                          'upgrade_selfie_tips_title'.tr,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: ColorX.blue,
                        ),
                      ],
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      'upgrade_selfie_tips'.tr,
                      fontSize: 13.0,
                      color: ColorX.black,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),
            ),

            ContainerX(height: 32.0),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      title: 'upgrade_camera_btn'.tr,
                      backgroundColor: ColorX.theme,
                      titleColor: ColorX.white,
                      faIcon: FontAwesomeIcons.camera,
                      faColor: ColorX.white,
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
                      backgroundColor: ColorX.lightGray,
                      titleColor: ColorX.black,
                      faIcon: FontAwesomeIcons.images,
                      faColor: ColorX.black,
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

            // Continue button
            Obx(
              () => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ButtonX(
                  title: 'upgrade_continue_btn'.tr,
                  backgroundColor: controller.capturedPhoto.value != null
                      ? ColorX.green
                      : ColorX.lightGray,
                  titleColor: controller.capturedPhoto.value != null
                      ? ColorX.white
                      : ColorX.gray,
                  cornerRadius: 12.0,
                  height: 50.0,
                  clicked: controller.capturedPhoto.value != null
                      ? () => controller.btnNextClicked()
                      : null,
                ),
              ),
            ),

            ContainerX(height: 24.0),
          ],
        ),
      ),
    );
  }
}
