import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_selfie_controller.dart';

class MbxUpgradeSelfieScreen extends StatelessWidget {
  const MbxUpgradeSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSelfieController>(
      init: MbxUpgradeSelfieController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC - Take Selfie',
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerX(height: 24.0),

            // Progress indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.theme,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.lightGray,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.lightGray,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.lightGray,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.lightGray,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ContainerX(
                      height: 4.0,
                      backgroundColor: ColorX.lightGray,
                      cornerRadius: 2.0,
                    ),
                  ),
                ],
              ),
            ),

            ContainerX(height: 32.0),

            // Step indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Step 1 of 6',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: ColorX.gray,
              ),
            ),

            ContainerX(height: 8.0),

            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Take Your Selfie',
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: ColorX.black,
              ),
            ),

            ContainerX(height: 8.0),

            // Subtitle
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Please take a clear selfie photo for identity verification',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: ColorX.gray,
                maxLines: 2,
              ),
            ),

            ContainerX(height: 32.0),

            // Camera preview area or captured photo
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Obx(
                () => ContainerX(
                  width: double.infinity,
                  height: 400.0,
                  backgroundColor: ColorX.lightGray.withValues(alpha: 0.3),
                  cornerRadius: 16.0,
                  borderColor: ColorX.theme.withValues(alpha: 0.3),
                  borderWidth: 2.0,
                  child: controller.capturedPhoto.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(14.0),
                          child: controller.buildPhotoWidget(
                            controller.capturedPhoto.value,
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageX(
                              faIcon: FontAwesomeIcons.camera,
                              color: ColorX.gray,
                              width: 64.0,
                              height: 64.0,
                            ),
                            ContainerX(height: 16.0),
                            TextX(
                              'No photo captured yet',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: ColorX.gray,
                            ),
                            ContainerX(height: 8.0),
                            TextX(
                              'Tap the camera button below to take a selfie',
                              fontSize: 14.0,
                              color: ColorX.gray,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ],
                        ),
                ),
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
                          'Tips for a good selfie:',
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: ColorX.blue,
                        ),
                      ],
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      '• Ensure good lighting\n• Look directly at the camera\n• Keep a neutral expression\n• Make sure your full face is visible',
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
                      title: 'Camera',
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
                      title: 'Gallery',
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
                  title: 'Continue',
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
