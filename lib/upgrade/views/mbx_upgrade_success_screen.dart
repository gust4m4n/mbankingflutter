import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_success_controller.dart';

class MbxUpgradeSuccessScreen extends StatelessWidget {
  const MbxUpgradeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MbxUpgradeSuccessController());
    return MbxScreen(
      title: 'upgrade_success_title'.tr,
      backAction: () {
        controller.btnBackToHomeClicked();
      },
      scrollingBody: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress indicator - all completed
          UpgradeLayoutHelper.buildProgressIndicator(6, 6),

          // Step indicator
          UpgradeLayoutHelper.buildStepIndicator('upgrade_step_6_of_6'.tr),

          // Title
          UpgradeLayoutHelper.buildHeader('upgrade_success_header'.tr),

          // Description
          UpgradeLayoutHelper.buildDescription('upgrade_success_desc'.tr),

          ContainerX(height: 32.0),

          // Success icon
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: ContainerX(
                width: 100.0,
                height: 100.0,
                backgroundColor: ColorX.green.withValues(alpha: 0.1),
                cornerRadius: 50.0,
                child: Center(
                  child: ContainerX(
                    width: 70.0,
                    height: 70.0,
                    backgroundColor: ColorX.green,
                    cornerRadius: 35.0,
                    child: Center(
                      child: ImageX(
                        faIcon: FontAwesomeIcons.check,
                        color: ColorX.white,
                        width: 32.0,
                        height: 32.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          ContainerX(height: 32.0),

          // Information card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ContainerX(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              backgroundColor: ColorX.theme.withValues(alpha: 0.1),
              cornerRadius: 16.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      ImageX(
                        faIcon: FontAwesomeIcons.clock,
                        color: ColorX.theme,
                        width: 20.0,
                        height: 20.0,
                      ),
                      ContainerX(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextX(
                              'upgrade_processing_time_label'.tr,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: ColorX.black,
                            ),
                            TextX(
                              'upgrade_processing_time_value'.tr,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: ColorX.gray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ContainerX(height: 16.0),
                  Row(
                    children: [
                      ImageX(
                        faIcon: FontAwesomeIcons.bell,
                        color: ColorX.theme,
                        width: 20.0,
                        height: 20.0,
                      ),
                      ContainerX(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextX(
                              'upgrade_notification_label'.tr,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: ColorX.black,
                            ),
                            TextX(
                              'upgrade_notification_desc'.tr,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: ColorX.gray,
                              maxLines: 3,
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

          // Features after upgrade
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: ContainerX(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              backgroundColor: ColorX.green.withValues(alpha: 0.1),
              cornerRadius: 16.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    'upgrade_whats_next'.tr,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    color: ColorX.black,
                  ),
                  ContainerX(height: 12.0),
                  _buildFeature('upgrade_feature_1'.tr),
                  _buildFeature('upgrade_feature_2'.tr),
                  _buildFeature('upgrade_feature_3'.tr),
                  _buildFeature('upgrade_feature_4'.tr),
                ],
              ),
            ),
          ),

          ContainerX(height: 32.0),

          // Continue button
          UpgradeLayoutHelper.buildContinueButton(
            title: 'upgrade_back_to_home'.tr,
            onPressed: () {
              controller.btnBackToHomeClicked();
            },
          ),

          ContainerX(height: 32.0),
        ],
      ),
    );
  }

  Widget _buildFeature(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          ImageX(
            faIcon: FontAwesomeIcons.circleCheck,
            color: ColorX.green,
            width: 16.0,
            height: 16.0,
          ),
          ContainerX(width: 8.0),
          Expanded(
            child: TextX(
              text,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: ColorX.black,
            ),
          ),
        ],
      ),
    );
  }
}
