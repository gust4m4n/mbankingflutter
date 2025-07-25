import 'package:camera/camera.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_ekyc_selfie_controller.dart';

class MbxEkycSelfieScreen extends StatelessWidget {
  const MbxEkycSelfieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxEkycSelfieController>(
      init: MbxEkycSelfieController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC - Selfie Verification',
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
            TextX(
              'Step 1 of 6',
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: ColorX.gray,
            ),

            ContainerX(height: 8.0),

            // Title
            TextX(
              'Take Your Selfie',
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
                'Please take a clear selfie photo for identity verification. Make sure your face is clearly visible and well-lit.',
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
                height: 300.0,
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
                            width: 300.0,
                            height: 300.0,
                            child: CameraPreview(controller.cameraController!),
                          ),
                        )
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ImageX(
                                faIcon: FontAwesomeIcons.camera,
                                color: ColorX.gray,
                                width: 48.0,
                                height: 48.0,
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
                    _buildInstruction('• Look directly at the camera'),
                    _buildInstruction('• Ensure good lighting'),
                    _buildInstruction('• Remove glasses or hat'),
                    _buildInstruction('• Keep a neutral expression'),
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
                    ? 'Capture Selfie'
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

            ContainerX(height: 16.0),

            // Retry button (shows when camera fails to initialize)
            if (!controller.isCameraInitialized)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: ButtonX(
                  title: 'Retry Camera',
                  backgroundColor: ColorX.gray,
                  titleColor: ColorX.white,
                  faIcon: FontAwesomeIcons.arrowRotateRight,
                  faColor: ColorX.white,
                  iconWidth: 16.0,
                  iconHeight: 16.0,
                  cornerRadius: 12.0,
                  height: 44.0,
                  clicked: () {
                    print('Retry camera button tapped!');
                    controller.retryCamera();
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
