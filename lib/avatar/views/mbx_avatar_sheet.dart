import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_avatar_controller.dart';

// ignore: must_be_immutable
class MbxAvatarSheet extends GetWidget<MbxAvatarController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(widget: this, title: 'Ganti Foto');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxAvatarController>(
      init: MbxAvatarController(),
      builder: (controller) => ContainerX(
        child: Padding(
          padding: EdgeInsets.only(
            left: 12.0,
            top: 0.0,
            right: 12.0,
            bottom: 12.0,
          ),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: ImageX(
                  faIcon: MbxProfileVM.profile.photo.isEmpty
                      ? FontAwesomeIcons.user
                      : null,
                  url: MbxProfileVM.profile.photo,
                  color: MbxProfileVM.profile.photo.isEmpty
                      ? ColorX.gray
                      : null,
                  width: double.infinity,
                  height: 100.0,
                  cornerRadius: 12.0,
                ),
              ),
              ContainerX(height: 12.0),
              Row(
                children: [
                  Expanded(
                    child: ButtonX(
                      title: 'Camera',
                      titleColor: ColorX.black,
                      backgroundColor: ColorX.white,
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      clicked: () {
                        controller.btnCameraClicked();
                      },
                    ),
                  ),
                  ContainerX(width: 8.0),
                  Expanded(
                    child: ButtonX(
                      title: 'Gallery',
                      titleColor: ColorX.black,
                      backgroundColor: ColorX.white,
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      clicked: () {
                        controller.btnGalleryClicked();
                      },
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(Get.context!).padding.bottom),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
