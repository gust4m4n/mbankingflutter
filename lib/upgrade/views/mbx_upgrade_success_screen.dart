import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_success_controller.dart';

class MbxUpgradeSuccessScreen extends StatelessWidget {
  const MbxUpgradeSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSuccessController>(
      init: MbxUpgradeSuccessController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC Complete',
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
              ), // Progress indicator - all completed
              // Step indicator
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: TextX(
                  'Step 6 dari 6',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                  textAlign: TextAlign.center,
                ),
              ),
              ContainerX(height: 8.0),

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
                        backgroundColor: ColorX.theme,
                        cornerRadius: 2.0,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Success icon
                      ContainerX(
                        width: 120.0,
                        height: 120.0,
                        backgroundColor: ColorX.green.withValues(alpha: 0.1),
                        cornerRadius: 60.0,
                        child: Center(
                          child: ContainerX(
                            width: 80.0,
                            height: 80.0,
                            backgroundColor: ColorX.green,
                            cornerRadius: 40.0,
                            child: Center(
                              child: ImageX(
                                faIcon: FontAwesomeIcons.check,
                                color: ColorX.white,
                                width: 40.0,
                                height: 40.0,
                              ),
                            ),
                          ),
                        ),
                      ),

                      ContainerX(height: 32.0),

                      // Success title
                      TextX(
                        'eKYC Verification Complete!',
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700,
                        color: ColorX.black,
                        textAlign: TextAlign.center,
                      ),

                      ContainerX(height: 16.0),

                      // Success message
                      TextX(
                        'Congratulations! Your identity verification has been successfully submitted. Your account will be upgraded within 1-2 business days.',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                        color: ColorX.gray,
                        textAlign: TextAlign.center,
                        maxLines: 10,
                      ),

                      ContainerX(height: 32.0),

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
                                        'Processing Time',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: ColorX.black,
                                      ),
                                      TextX(
                                        '1-2 business days',
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
                                        'Notification',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                        color: ColorX.black,
                                      ),
                                      TextX(
                                        'You will be notified once your verification is complete',
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

                      ContainerX(height: 32.0),

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
                              'What\'s Next?',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: ColorX.black,
                            ),
                            ContainerX(height: 12.0),
                            _buildFeature('Higher transaction limits'),
                            _buildFeature('Access to premium features'),
                            _buildFeature('Priority customer support'),
                            _buildFeature('Enhanced security features'),
                          ],
                        ),
                      ),
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
                  title: 'Back to Home',
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
