import 'package:mbxflutter/transfer/p2bank/models/mbx_transfer_p2bank_service_model.dart';

import '../../../widget-x/all_widgets.dart';
import 'mbx_transfer_p2bank_service_picker_controller.dart';
import 'mbx_transfer_p2bank_service_widget.dart';

// ignore: must_be_immutable
class MbxTransferP2BankServicePicker
    extends GetWidget<MbxTransferP2BankServicePickerController> {
  final List<MbxTransferP2BankServiceModel> list;
  MbxTransferP2BankServicePicker(this.list);

  static Future<T?> show<T>(List<MbxTransferP2BankServiceModel> list) {
    FocusManager.instance.primaryFocus?.unfocus();
    final sheet = MbxTransferP2BankServicePicker(list);
    return SheetX.showCustom(widget: sheet, title: 'Layanan Transfer');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferP2BankServicePickerController>(
      init: MbxTransferP2BankServicePickerController(list),
      builder: (controller) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            physics: ClampingScrollPhysics(),
            separatorBuilder: (context, index) {
              return ContainerX(height: 8.0);
            },
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return MbxTransferP2BankServiceWidget(
                service: controller.list[index],
                borders: true,
                onEyeClicked: () {},
                clicked: () {
                  Get.back(result: controller.list[index]);
                },
              );
            },
          ),
          ContainerX(height: 16.0),
          ContainerX(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: ButtonX(
              title: 'Batal',
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
