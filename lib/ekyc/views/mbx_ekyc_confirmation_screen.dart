import 'dart:io';

import '../../widget-x/all_widgets.dart';
import 'mbx_ekyc_confirmation_controller.dart';

class MbxEkycConfirmationScreen extends StatelessWidget {
  const MbxEkycConfirmationScreen({super.key});

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
                                  child: controller.hasSelfiePath
                                      ? Image.file(
                                          File(controller.selfiePath!),
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ImageX(
                                                faIcon: FontAwesomeIcons.user,
                                                color: ColorX.gray,
                                                width: 32.0,
                                                height: 32.0,
                                              ),
                                              ContainerX(height: 8.0),
                                              TextX(
                                                'No Photo',
                                                fontSize: 12.0,
                                                color: ColorX.gray,
                                              ),
                                            ],
                                          ),
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
                        // Selfie with KTP Photo
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
                                  child: controller.hasSelfieKtpPath
                                      ? Image.file(
                                          File(controller.selfieKtpPath!),
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ImageX(
                                                faIcon: FontAwesomeIcons.idCard,
                                                color: ColorX.gray,
                                                width: 32.0,
                                                height: 32.0,
                                              ),
                                              ContainerX(height: 8.0),
                                              TextX(
                                                'No Photo',
                                                fontSize: 12.0,
                                                color: ColorX.gray,
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'Selfie + ID',
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: ColorX.black,
                              ),
                            ],
                          ),
                        ),
                        ContainerX(width: 12.0),
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
                                  child: controller.hasKtpPhotoPath
                                      ? Image.file(
                                          File(controller.ktpPhotoPath!),
                                          fit: BoxFit.cover,
                                        )
                                      : Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ImageX(
                                                faIcon: FontAwesomeIcons
                                                    .addressCard,
                                                color: ColorX.gray,
                                                width: 32.0,
                                                height: 32.0,
                                              ),
                                              ContainerX(height: 8.0),
                                              TextX(
                                                'No Photo',
                                                fontSize: 12.0,
                                                color: ColorX.gray,
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                              ),
                              ContainerX(height: 8.0),
                              TextX(
                                'ID Card',
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

            ContainerX(height: 20.0),

            // Personal Information Section
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
                      'Personal Information',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                    ),
                    ContainerX(height: 16.0),
                    _buildInfoRow('Full Name', 'John Doe Smith'),
                    _buildInfoRow('ID Card Number', '1234567890123456'),
                    _buildInfoRow('Date of Birth', '15/08/1990'),
                    _buildInfoRow('Gender', 'Male'),
                    _buildInfoRow(
                      'Address',
                      'Jl. Contoh Alamat No. 123, Jakarta Selatan, DKI Jakarta 12345',
                    ),
                  ],
                ),
              ),
            ),

            ContainerX(height: 32.0),

            // Disclaimer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ContainerX(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                backgroundColor: ColorX.yellow.withValues(alpha: 0.1),
                cornerRadius: 12.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageX(
                          faIcon: FontAwesomeIcons.triangleExclamation,
                          color: ColorX.yellow,
                          width: 20.0,
                          height: 20.0,
                        ),
                        ContainerX(width: 8.0),
                        TextX(
                          'Important Notice',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: ColorX.black,
                        ),
                      ],
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      'By submitting this eKYC verification, you confirm that all information provided is accurate and complete. False information may result in account suspension.',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.black,
                      maxLines: 10,
                    ),
                  ],
                ),
              ),
            ),

            ContainerX(height: 32.0),

            // Upgrade Benefits Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ContainerX(
                backgroundColor: ColorX.lightGray.withValues(alpha: 0.5),
                cornerRadius: 16.0,
                padding: EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    // Icon container
                    ContainerX(
                      width: 60.0,
                      height: 60.0,
                      backgroundColor: ColorX.theme.withValues(alpha: 0.1),
                      cornerRadius: 30.0,
                      child: Center(
                        child: ImageX(
                          faIcon: FontAwesomeIcons.crown,
                          color: ColorX.theme,
                          width: 28.0,
                          height: 28.0,
                        ),
                      ),
                    ),
                    ContainerX(width: 16.0),
                    // Text content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextX(
                            'Upgrade Benefits',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: ColorX.black,
                          ),
                          ContainerX(height: 4.0),
                          TextX(
                            'Dengan melakukan upgrade dapatkan limit hingga 10 juta rupiah dan benefit lainnya.',
                            fontSize: 13.0,
                            color: ColorX.gray,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    ContainerX(width: 12.0),
                    // Upgrade button
                    ContainerX(
                      child: ButtonX(
                        title: 'Upgrade',
                        backgroundColor: ColorX.theme,
                        titleColor: ColorX.white,
                        cornerRadius: 20.0,
                        height: 40.0,
                        width: 80.0,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        clicked: () {
                          // TODO: Implement upgrade functionality
                          Get.snackbar(
                            'Upgrade',
                            'Upgrade feature coming soon!',
                            backgroundColor: ColorX.theme,
                            colorText: ColorX.white,
                          );
                        },
                      ),
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
                title: controller.isSubmitting
                    ? 'Submitting...'
                    : 'Submit eKYC',
                backgroundColor: ColorX.theme,
                disabledBackgroundColor: ColorX.theme.withValues(alpha: 0.3),
                titleColor: ColorX.white,
                cornerRadius: 12.0,
                height: 52.0,
                enabled: !controller.isSubmitting,
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

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: TextX(
              label,
              fontSize: 14.0,
              fontWeight: FontWeight.w500,
              color: ColorX.gray,
            ),
          ),
          ContainerX(width: 8.0),
          Expanded(
            flex: 3,
            child: TextX(
              value,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: ColorX.black,
              maxLines: 5,
            ),
          ),
        ],
      ),
    );
  }
}
