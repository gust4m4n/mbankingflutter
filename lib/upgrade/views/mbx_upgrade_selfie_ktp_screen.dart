import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_selfie_ktp_controller.dart';

class MbxUpgradeSelfieKtpScreen extends StatelessWidget {
  const MbxUpgradeSelfieKtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeSelfieKtpController>(
      init: MbxUpgradeSelfieKtpController(),
      builder: (controller) => MbxScreen(
        title: 'eKYC - Selfie dengan KTP',
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
                'Step 2 of 6',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: ColorX.gray,
              ),
            ),
            ContainerX(height: 8.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Ambil foto selfie sambil memegang KTP Anda',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: ColorX.black,
              ),
            ),
            ContainerX(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                'Pastikan wajah dan KTP Anda terlihat jelas dan tidak terpotong.',
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
                      title: 'Ambil Foto',
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
                      title: 'Dari Galeri',
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
                title: 'Lanjut',
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
