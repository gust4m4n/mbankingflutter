import 'dart:io';

import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_confirmation_controller.dart';

class MbxUpgradeConfirmationScreen extends StatelessWidget {
  const MbxUpgradeConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeConfirmationController>(
      init: MbxUpgradeConfirmationController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_confirmation_title'.tr,
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContainerX(height: 24.0),

            // Progress indicator - step 5 of 6
            UpgradeLayoutHelper.buildProgressIndicator(5, 6),

            ContainerX(height: 32.0),

            // Step indicator
            UpgradeLayoutHelper.buildStepIndicator('upgrade_step_5_of_6'.tr),

            ContainerX(height: 8.0),

            // Title
            UpgradeLayoutHelper.buildHeader('upgrade_confirmation_header'.tr),

            ContainerX(height: 16.0),

            // Description
            UpgradeLayoutHelper.buildDescription(
              'upgrade_confirmation_desc'.tr,
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
                      'upgrade_captured_photos'.tr,
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
                                  child:
                                      controller.hasSelfiePath &&
                                          controller.selfiePath != null
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
                                                'upgrade_no_photo_text'.tr,
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
                                'upgrade_selfie_label'.tr,
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
                                  child:
                                      controller.hasSelfieKtpPath &&
                                          controller.selfieKtpPath != null
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
                                                'upgrade_no_photo_text'.tr,
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
                                'upgrade_selfie_ktp_label'.tr,
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
                                  child:
                                      controller.hasKtpPhotoPath &&
                                          controller.ktpPhotoPath != null
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
                                                'upgrade_no_photo_text'.tr,
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
                                'upgrade_id_card_label_confirm'.tr,
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
                      'upgrade_personal_info_section'.tr,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                    ),
                    ContainerX(height: 16.0),
                    _buildInfoRow(
                      'upgrade_full_name_confirm'.tr,
                      controller.fullName,
                    ),
                    _buildInfoRow(
                      'upgrade_id_card_number_confirm'.tr,
                      controller.idNumber,
                    ),
                    _buildInfoRow(
                      'upgrade_dob_confirm'.tr,
                      controller.dateOfBirth,
                    ),
                    _buildInfoRow(
                      'upgrade_gender_confirm'.tr,
                      controller.gender,
                    ),
                    _buildInfoRow(
                      'upgrade_address_confirm'.tr,
                      controller.address,
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
                          'upgrade_important_notice'.tr,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: ColorX.black,
                        ),
                      ],
                    ),
                    ContainerX(height: 8.0),
                    TextX(
                      'upgrade_notice_text'.tr,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.black,
                      maxLines: 10,
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
                    ? 'upgrade_submitting'.tr
                    : 'upgrade_submit_ekyc'.tr,
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
