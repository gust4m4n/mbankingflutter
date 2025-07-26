import '../../widget-x/all_widgets.dart';
import '../widgets/upgrade_layout_helper.dart';
import 'mbx_upgrade_success_controller.dart';

class MbxUpgradeSuccessScreen extends StatelessWidget {
  const MbxUpgradeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSuccessController>(
      init: MbxUpgradeSuccessController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_success_title'.tr,
        navigationBarHidden: true,
        body: ContainerX(
          width: double.infinity,
          height: double.infinity,
          backgroundColor: ColorX.white,
          child: Column(
            children: [
              Container(
                height:
                    (Get.context != null
                        ? MediaQuery.of(Get.context!).padding.top
                        : 44.0) +
                    24.0,
              ),

              // Progress indicator - all completed
              UpgradeLayoutHelper.buildProgressIndicator(6, 6),

              // Step indicator
              UpgradeLayoutHelper.buildStepIndicator('upgrade_step_6_of_6'.tr),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Success icon
                      ContainerX(
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

                      ContainerX(height: 24.0),

                      // Success title
                      TextX(
                        'upgrade_success_header'.tr,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: ColorX.black,
                        textAlign: TextAlign.center,
                      ),

                      ContainerX(height: 12.0),

                      // Success message
                      TextX(
                        'upgrade_success_desc'.tr,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: ColorX.gray,
                        textAlign: TextAlign.center,
                        maxLines: 10,
                      ),

                      ContainerX(height: 24.0),

                      // Information card
                      ContainerX(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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

                      ContainerX(height: 24.0),

                      // Features after upgrade
                      ContainerX(
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

                      // Extra spacing at bottom for scroll
                      ContainerX(height: 24.0),
                    ],
                  ),
                ),
              ),

              // Bottom button
              Padding(
                padding: EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  bottom:
                      (Get.context != null
                          ? MediaQuery.of(Get.context!).padding.bottom
                          : 16.0) +
                      24.0,
                ),
                child: ButtonX(
                  title: 'upgrade_back_to_home'.tr,
                  backgroundColor: ColorX.theme,
                  titleColor: ColorX.white,
                  cornerRadius: 12.0,
                  height: 52.0,
                  clicked: () {
                    controller.btnBackToHomeClicked();
                  },
                ),
              ),
            ],
          ),
        ),
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
