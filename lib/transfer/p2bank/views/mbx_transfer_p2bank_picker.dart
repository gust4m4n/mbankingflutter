import '../../../widget-x/all_widgets.dart';
import 'mbx_transfer_p2bank_picker_controller.dart';
import 'mbx_transfer_p2bank_picker_widget.dart';

// ignore: must_be_immutable
class MbxTransferP2BankPicker
    extends GetWidget<MbxTransferP2BankPickerController> {
  const MbxTransferP2BankPicker({super.key});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(
      title: 'Rekening Tujuan',
      widget: this,
      percentHeight: 1.0,
      onAddClicked: (() {
        final controller = Get.find<MbxTransferP2BankPickerController>();
        controller.onAddClicked();
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTransferP2BankPickerController>(
      init: MbxTransferP2BankPickerController(),
      builder: (controller) => ContainerX(
        backgroundColor: ColorX.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 16.0,
                top: 0.0,
                right: 16.0,
                bottom: 12.0,
              ),
              child: TextFieldX(
                hint: 'Pencarian...',
                obscureText: false,
                keyboardType: TextInputType.text,
                readOnly: false,
                controller: controller.txtSearch,
                leftIcon: ImageX(
                  faIcon: FontAwesomeIcons.magnifyingGlass,
                  color: ColorX.gray,
                  width: 20,
                  height: 20,
                ),
                onChanged: (value) {
                  controller.txtSearchChanged(value);
                },
              ),
            ),
            Expanded(
              child: controller.loading
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorX.gray),
                      ),
                    )
                  : Scrollbar(
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: ClampingScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: ContainerX(
                              height: 0.5,
                              width: double.infinity,
                              backgroundColor: ColorX.lightGray,
                            ),
                          );
                        },
                        itemCount: controller.destListVM.filtered.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWellX(
                            highlightColor: ColorX.theme.withValues(alpha: 0.1),
                            clicked: () {
                              Get.back(
                                result: controller.destListVM.filtered[index],
                              );
                            },
                            child: MbxTransferP2BankPickerWidget(
                              dest: controller.destListVM.filtered[index],
                              onDeleteClicked: () {
                                controller.onDeleteClicked(
                                  controller.destListVM.filtered[index],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
