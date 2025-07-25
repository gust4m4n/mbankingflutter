import '../../widget-x/all_widgets.dart';
import 'mbx_string_picker_controller.dart';
import 'mbx_string_picker_widget.dart';

// ignore: must_be_immutable
class MbxStringPicker extends GetWidget<MbxStringPickerController> {
  final String title;
  final List<String> list;
  const MbxStringPicker({super.key, required this.title, required this.list});

  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(title: title, widget: this, percentHeight: 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxStringPickerController>(
      init: MbxStringPickerController(list: list),
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
              child: Scrollbar(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: ClampingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: ContainerX(
                        height: 0.5,
                        width: double.infinity,
                        backgroundColor: ColorX.lightGray,
                      ),
                    );
                  },
                  itemCount: controller.filtered.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Material(
                      color: ColorX.transparent,
                      child: InkWell(
                        highlightColor: ColorX.highlight,
                        onTap: () {
                          Get.back(result: index);
                        },
                        child: MbxStringPickerWidget(
                          title: controller.filtered[index],
                        ),
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
