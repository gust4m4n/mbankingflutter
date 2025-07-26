import 'dart:io';

import '../../widget-x/all_widgets.dart';
import 'mbx_ekyc_confirmation_controller.dart';

class MbxEkycConfirmationScreen extends StatelessWidget {
  const MbxEkycConfirmationScreen({super.key});

  // Helper method to build photo widget from universal data
  Widget _buildPhotoWidget(dynamic photo, String placeholder) {
    if (photo == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageX(
              faIcon: FontAwesomeIcons.image,
              color: ColorX.gray,
              width: 32.0,
              height: 32.0,
            ),
            ContainerX(height: 8.0),
            TextX(
              placeholder,
              fontSize: 12.0,
              color: ColorX.gray,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (kIsWeb && photo is Uint8List) {
      return Image.memory(photo, fit: BoxFit.cover);
    } else if (photo is File) {
      return Image.file(photo, fit: BoxFit.cover);
    } else if (photo is String) {
      return Image.file(File(photo), fit: BoxFit.cover);
    }

    return Center(
      child: TextX(
        'Unsupported photo format',
        fontSize: 12.0,
        color: ColorX.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxEkycConfirmationController>(
      init: MbxEkycConfirmationController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC - Confirmation',
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
                ],
              ),
            ),

            ContainerX(height: 32.0),

            // Step indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Step 5 of 6',
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
                'Confirm Your Information',
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: ColorX.black,
              ),
            ),

            ContainerX(height: 16.0),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Please review your information before submitting. Make sure all details are correct.',
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: ColorX.gray,
                maxLines: 10,
              ),
            ),

            ContainerX(height: 32.0),

            // Photos Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ContainerX(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                backgroundColor: ColorX.white,
                borderWidth: 1.0,
                borderColor: ColorX.lightGray,
                cornerRadius: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextX(
                      'Captured Photos',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                    ),
                    ContainerX(height: 16.0),
                    Row(
                      children: [
                        // Selfie Photo
                        Expanded(
                          child: Column(
                            children: [
                              ContainerX(
                                width: double.infinity,
                                height: 120.0,
                                backgroundColor: ColorX.lightGray,
                                cornerRadius: 8.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: _buildPhotoWidget(
                                    controller.selfiePhoto,
                                    'No Selfie',
                                  ),
                                ),
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'Selfie',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.black,
                              ),
                            ],
                          ),
                        ),
                        ContainerX(width: 12.0),
                        // Selfie + KTP Photo
                        Expanded(
                          child: Column(
                            children: [
                              ContainerX(
                                width: double.infinity,
                                height: 120.0,
                                backgroundColor: ColorX.lightGray,
                                cornerRadius: 8.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: _buildPhotoWidget(
                                    controller.selfieKtpPhoto,
                                    'No Selfie + KTP',
                                  ),
                                ),
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'Selfie + KTP',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.black,
                              ),
                            ],
                          ),
                        ),
                        ContainerX(width: 12.0),
                        // KTP Photo
                        Expanded(
                          child: Column(
                            children: [
                              ContainerX(
                                width: double.infinity,
                                height: 120.0,
                                backgroundColor: ColorX.lightGray,
                                cornerRadius: 8.0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: _buildPhotoWidget(
                                    controller.ktpPhoto,
                                    'No KTP Photo',
                                  ),
                                ),
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'KTP',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ContainerX(height: 24.0),

            // Submit button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonX(
                title: 'Submit eKYC',
                backgroundColor: ColorX.green,
                titleColor: ColorX.white,
                cornerRadius: 12.0,
                height: 50.0,
                clicked: () {
                  controller.btnSubmitClicked();
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
