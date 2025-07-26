import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_selfie_ktp_controller.dart';

class MbxUpgradeSelfieKtpScreen extends StatelessWidget {
  const MbxUpgradeSelfieKtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSelfieKtpController>(
      init: MbxUpgradeSelfieKtpController(),
      builder: (controller) => MbxScreen(
        title: 'upgrade_selfie_ktp_title'.tr,
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContainerX(height: 24.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'upgrade_step_2_of_6'.tr,
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: ColorX.gray,
              ),
            ),
            ContainerX(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'upgrade_selfie_ktp_header'.tr,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ColorX.black,
              ),
            ),
            ContainerX(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'upgrade_selfie_ktp_desc'.tr,
                fontSize: 16.0,
                color: ColorX.gray,
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),
            ContainerX(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.buildPhotoWidget(),
            ),
            ContainerX(height: 32.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      title: 'upgrade_camera_btn'.tr,
                      backgroundColor: ColorX.theme,
                      titleColor: ColorX.white,
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
                      title: 'upgrade_gallery_btn'.tr,
                      backgroundColor: ColorX.gray,
                      titleColor: ColorX.white,
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ButtonX(
                title: 'upgrade_continue_btn'.tr,
                backgroundColor: ColorX.green,
                titleColor: ColorX.white,
                cornerRadius: 12.0,
                height: 50.0,
                clicked: () {
                  controller.btnNextClicked();
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
