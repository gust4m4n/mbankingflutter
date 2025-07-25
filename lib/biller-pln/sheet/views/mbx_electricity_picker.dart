import 'package:mbxflutter/utils/all_utils.dart';

import '../../../home-tab/views/mbx_launcher_widget.dart';
import '../../../widget-x/all_widgets.dart';
import 'mbx_electricity_controller.dart';

// ignore: must_be_immutable
class MbxElectricityPicker extends GetWidget<MbxElectricityController> {
  const MbxElectricityPicker({super.key});
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(widget: this, title: 'Listrik PLN');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxElectricityController>(
      init: MbxElectricityController(),
      builder: (controller) => ContainerX(
        child: Wrap(
          children: [
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                left: 16.0,
                top: 0.0,
                right: 16.0,
                bottom: 16.0,
              ),
              physics: ClampingScrollPhysics(),
              children: [
                ContainerX(
                  backgroundColor: ColorX.theme,
                  cornerRadius: 12.0,
                  child: GridView.count(
                    shrinkWrap: true,
                    mainAxisSpacing: 0.0,
                    crossAxisSpacing: 0.0,
                    childAspectRatio: 1.02,
                    crossAxisCount: 3,
                    padding: EdgeInsets.all(12.0),
                    physics: ClampingScrollPhysics(),
                    children: [
                      MbxLauncherWidget(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.solidLightbulb,
                        title: 'prepaid'.tr,
                        titleColor: ColorX.white,
                        highlightColor: ColorX.theme.lighten(0.1),
                        clicked: () {
                          controller.btnPrepaidClicked();
                        },
                      ),
                      MbxLauncherWidget(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.solidLightbulb,
                        title: 'postpaid'.tr,
                        titleColor: ColorX.white,
                        highlightColor: ColorX.theme.lighten(0.1),
                        clicked: () {
                          controller.btnPostpaidClicked();
                        },
                      ),
                      MbxLauncherWidget(
                        color: ColorX.yellow,
                        faIcon: FontAwesomeIcons.solidLightbulb,
                        title: 'Non-Tagihan Listrik',
                        titleColor: ColorX.white,
                        highlightColor: ColorX.theme.lighten(0.1),
                        clicked: () {
                          controller.btnNonTagLisClicked();
                        },
                      ),
                    ],
                  ),
                ),
                ContainerX(height: 16.0),
                ButtonX(
                  title: 'back'.tr,
                  titleColor: ColorX.black,
                  backgroundColor: ColorX.transparent,
                  borderWidth: 1.0,
                  borderColor: ColorX.gray,
                  clicked: () {
                    controller.btnCloseClicked();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
