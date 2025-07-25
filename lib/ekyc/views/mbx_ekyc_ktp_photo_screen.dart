import 'package:camera/camera.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_ekyc_ktp_photo_controller.dart';

class MbxEkycKtpPhotoScreen extends StatelessWidget {
  const MbxEkycKtpPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxEkycKtpPhotoController>(
      init: MbxEkycKtpPhotoController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC - ID Card Photo',
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                      backgroundColor: ColorX.theme,
                      cornerRadius: 2.0,
                    ),
                  ),
                  ContainerX(width: 8.0),
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
                ],
              ),
            ),

            ContainerX(height: 32.0),

            // Step indicator
            TextX(
              'Step 3 of 6',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: ColorX.gray,
            ),

            ContainerX(height: 8.0),

            // Title
            TextX(
              'Capture ID Card Photo',
              fontSize: 24.0,
              fontWeight: FontWeight.w700,
              color: ColorX.black,
              textAlign: TextAlign.center,
            ),

            ContainerX(height: 16.0),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Take a clear photo of your ID card. Make sure all text and details are clearly visible and readable.',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: ColorX.gray,
                textAlign: TextAlign.center,
                maxLines: 10,
              ),
            ),

            ContainerX(height: 32.0),

            // Camera preview area
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ContainerX(
                width: double.infinity,
                height: 250.0,
                backgroundColor: ColorX.lightGray,
                cornerRadius: 16.0,
                borderWidth: 2.0,
                borderColor: ColorX.theme,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.0),
                  child:
                      controller.isCameraInitialized &&
                          controller.cameraController != null
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: 320.0,
                            height: 240.0,
                            child: CameraPreview(controller.cameraController!),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ContainerX(
                                width: 120.0,
                                height: 80.0,
                                backgroundColor: ColorX.white,
                                cornerRadius: 8.0,
                                borderWidth: 2.0,
                                borderColor: ColorX.gray,
                                child: Center(
                                  child: ImageX(
                                    faIcon: FontAwesomeIcons.idCard,
                                    color: ColorX.gray,
                                    width: 32.0,
                                    height: 32.0,
                                  ),
                                ),
                              ),
                              ContainerX(height: 16.0),
                              TextX(
                                'Initializing Camera...',
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.gray,
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'Please wait while camera loads',
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: ColorX.gray,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),

            ContainerX(height: 32.0),

            // Instructions
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: ContainerX(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                backgroundColor: ColorX.theme.withValues(alpha: 0.1),
                cornerRadius: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextX(
                      'Instructions:',
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                    ),
                    ContainerX(height: 8.0),
                    _buildInstruction('• Place ID card on flat surface'),
                    _buildInstruction('• Ensure all text is readable'),
                    _buildInstruction('• Avoid shadows and glare'),
                    _buildInstruction('• Keep camera steady'),
                    _buildInstruction('• Make sure entire card is visible'),
                  ],
                ),
              ),
            ),

            ContainerX(height: 32.0),

            // Capture button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: ButtonX(
                title: controller.isCameraInitialized
                    ? 'Capture ID Card'
                    : 'Initializing Camera...',
                backgroundColor: controller.isCameraInitialized
                    ? ColorX.theme
                    : ColorX.gray,
                disabledBackgroundColor: ColorX.gray.withValues(alpha: 0.3),
                titleColor: ColorX.white,
                faIcon: FontAwesomeIcons.camera,
                faColor: ColorX.white,
                iconWidth: 20.0,
                iconHeight: 20.0,
                cornerRadius: 12.0,
                height: 52.0,
                enabled: controller.isCameraInitialized,
                clicked: () {
                  print('Capture button tapped!');
                  controller.btnCaptureClicked();
                },
              ),
            ),

            ContainerX(height: 24.0),
          ],
        ),
      ),
    );
  }

  Widget _buildInstruction(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 4.0),
      child: TextX(
        text,
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: ColorX.black,
      ),
    );
  }
}
