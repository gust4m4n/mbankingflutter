import '../../widget-x/all_widgets.dart';
import 'mbx_upgrade_ktp_photo_controller.dart';

class MbxUpgradeKtpPhotoScreen extends StatelessWidget {
  const MbxUpgradeKtpPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxUpgradeKtpPhotoController>(
      init: MbxUpgradeKtpPhotoController(),
      builder: (controller) => MbxScreen(
        title: 'Upgrade - ID Card Photo',
        backAction: () {
          controller.btnBackClicked();
        },
        scrollingBody: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ContainerX(height: 24.0),

            // Step indicator
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                "Step 3 dari 6",
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
                textAlign: TextAlign.center,
              ),
            ),

            ContainerX(height: 8.0),

            // Title
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                "Ambil Foto ID Card",
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
            ),

            ContainerX(height: 16.0),

            // Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextX(
                "Pastikan foto ID card Anda terlihat jelas dan tidak ada bagian yang terpotong.",
                fontSize: 16.0,
                color: Colors.grey[600],
                textAlign: TextAlign.center,
                maxLines: 3,
              ),
            ),

            ContainerX(height: 32.0),

            // Photo preview
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: controller.buildPhotoWidget(),
            ),

            ContainerX(height: 32.0),

            // Action buttons
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      faIcon: Icons.camera_alt,
                      title: "Kamera",
                      clicked: controller.isLoading
                          ? null
                          : () {
                              controller.btnCaptureClicked();
                            },
                    ),
                  ),
                  ContainerX(width: 16.0),
                  Expanded(
                    child: ButtonX(
                      faIcon: Icons.photo_library,
                      title: "Galeri",
                      backgroundColor: Colors.grey[200]!,
                      titleColor: ColorX.black,
                      clicked: controller.isLoading
                          ? null
                          : () {
                              controller.btnGalleryClicked();
                            },
                    ),
                  ),
                ],
              ),
            ),

            ContainerX(height: 24.0),

            // Next button
            if (controller.hasPhoto)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ButtonX(
                  title: "Lanjutkan",
                  clicked: () {
                    controller.btnNextClicked();
                  },
                ),
              ),

            ContainerX(height: 32.0),
          ],
        ),
      ),
    );
  }
}
