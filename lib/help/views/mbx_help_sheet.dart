import 'package:mbxflutter/help/views/mbx_help_widget.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_help_controller.dart';

// ignore: must_be_immutable
class MbxHelpSheet extends GetWidget<MbxHelpController> {
  MbxHelpSheet();

  static Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxHelpSheet();
    return SheetX.showCustom(widget: sheet, title: 'Pusat Bantuan');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHelpController>(
      init: MbxHelpController(),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            physics: ClampingScrollPhysics(),
            children: [
              MbxHelpWidget(
                faIcon: FontAwesomeIcons.headset,
                title: 'Call Center',
                clicked: () {
                  Get.back();
                  //
                },
              ),
              SizedBox(height: 8.0),
              MbxHelpWidget(
                faIcon: FontAwesomeIcons.commentSms,
                title: 'SMS',
                clicked: () {
                  Get.back();
                  //
                },
              ),
              SizedBox(height: 8.0),
              MbxHelpWidget(
                faIcon: FontAwesomeIcons.whatsapp,
                title: 'WhatsApp',
                clicked: () {
                  Get.back();
                  //
                },
              ),
            ],
          ),
          ContainerX(height: 16.0),
          ContainerX(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ButtonX(
              title: 'Tutup',
              backgroundColor: ColorX.theme,
              clicked: () {
                Get.back();
              },
            ),
          ),
          ContainerX(height: 16.0),
        ],
      ),
    );
  }
}
