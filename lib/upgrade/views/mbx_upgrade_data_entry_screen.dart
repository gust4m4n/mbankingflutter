import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_data_entry_controller.dart';

class MbxUpgradeDataEntryScreen extends StatelessWidget {
  const MbxUpgradeDataEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeDataEntryController>(
      init: MbxUpgradeDataEntryController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_personal_info_title'.tr,
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
                'upgrade_step_4_of_6'.tr,
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
                'upgrade_personal_info_header'.tr,
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
                'upgrade_personal_info_desc'.tr,
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: ColorX.gray,
                maxLines: 10,
              ),
            ),

            ContainerX(height: 32.0),

            // Full Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_full_name_label'.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 8.0),
                  TextFieldX(
                    hint: 'upgrade_full_name_hint'.tr,
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    readOnly: false,
                    controller: controller.fullNameController,
                    focusNode: controller.fullNameNode,
                    onChanged: (value) {
                      controller.fullNameChanged(value);
                    },
                  ),
                ],
              ),
            ),

            ContainerX(height: 20.0),

            // ID Number
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_id_card_label'.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 8.0),
                  TextFieldX(
                    hint: 'upgrade_id_card_hint'.tr,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    readOnly: false,
                    controller: controller.idNumberController,
                    focusNode: controller.idNumberNode,
                    onChanged: (value) {
                      controller.idNumberChanged(value);
                    },
                  ),
                ],
              ),
            ),

            ContainerX(height: 20.0),

            // Date of Birth
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_dob_label'.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 8.0),
                  InkWellX(
                    clicked: () {
                      controller.btnDateOfBirthClicked();
                    },
                    child: ContainerX(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 16.0,
                      ),
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      cornerRadius: 8.0,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextX(
                              controller.dateOfBirth.isEmpty
                                  ? 'upgrade_dob_hint'.tr
                                  : controller.dateOfBirth,
                              fontSize: 16.0,
                              color: controller.dateOfBirth.isEmpty
                                  ? ColorX.gray
                                  : ColorX.black,
                            ),
                          ),
                          ImageX(
                            faIcon: FontAwesomeIcons.calendar,
                            color: ColorX.gray,
                            width: 16.0,
                            height: 16.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            ContainerX(height: 20.0),

            // Gender
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_gender_label'.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 8.0),
                  Row(
                    children: [
                      Expanded(
                        child: InkWellX(
                          clicked: () {
                            controller.selectGender('Male');
                          },
                          child: ContainerX(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            borderWidth: 1.0,
                            borderColor: controller.gender == 'Male'
                                ? ColorX.theme
                                : ColorX.lightGray,
                            backgroundColor: controller.gender == 'Male'
                                ? ColorX.theme.withValues(alpha: 0.1)
                                : ColorX.white,
                            cornerRadius: 8.0,
                            child: Center(
                              child: TextX(
                                'upgrade_gender_male'.tr,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: controller.gender == 'Male'
                                    ? ColorX.theme
                                    : ColorX.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ContainerX(width: 12.0),
                      Expanded(
                        child: InkWellX(
                          clicked: () {
                            controller.selectGender('Female');
                          },
                          child: ContainerX(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            borderWidth: 1.0,
                            borderColor: controller.gender == 'Female'
                                ? ColorX.theme
                                : ColorX.lightGray,
                            backgroundColor: controller.gender == 'Female'
                                ? ColorX.theme.withValues(alpha: 0.1)
                                : ColorX.white,
                            cornerRadius: 8.0,
                            child: Center(
                              child: TextX(
                                'upgrade_gender_female'.tr,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: controller.gender == 'Female'
                                    ? ColorX.theme
                                    : ColorX.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ContainerX(height: 20.0),

            // Address
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_address_label'.tr,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 8.0),
                  TextFieldX(
                    hint: 'upgrade_address_hint'.tr,
                    obscureText: false,
                    keyboardType: TextInputType.multiline,
                    readOnly: false,
                    multiline: true,
                    controller: controller.addressController,
                    focusNode: controller.addressNode,
                    onChanged: (value) {
                      controller.addressChanged(value);
                    },
                  ),
                ],
              ),
            ),

            ContainerX(height: 32.0),

            // Continue button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonX(
                title: 'upgrade_continue_btn'.tr,
                backgroundColor: ColorX.theme,
                disabledBackgroundColor: ColorX.theme.withValues(alpha: 0.3),
                titleColor: ColorX.white,
                cornerRadius: 12.0,
                height: 52.0,
                enabled: controller.isFormValid(),
                clicked: () {
                  print('Continue button tapped!');
                  controller.btnContinueClicked();
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
