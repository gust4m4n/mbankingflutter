import 'package:mbankingflutter/utils/all_utils.dart';

import '../../widgets/all_widgets.dart';
import '../../home-page/views/mbx_launcher_widget.dart';
import 'mbx_pulsa_controller.dart';

// ignore: must_be_immutable
class MbxPulsaPicker extends GetWidget<MbxPulsaController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showCustom(widget: this, title: 'Pulsa');
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPulsaController>(
        init: MbxPulsaController(),
        builder: (controller) => ContainerX(
                child: Wrap(children: [
              ListView(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                    left: 16.0, top: 0.0, right: 16.0, bottom: 16.0),
                physics: ClampingScrollPhysics(),
                children: [
                  ContainerX(
                    backgroundColor: ColorX.theme,
                    cornerRadius: 12.0,
                    child: GridView.count(
                      shrinkWrap: true,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1.2,
                      crossAxisCount: 3,
                      padding: EdgeInsets.all(12.0),
                      physics: ClampingScrollPhysics(),
                      children: [
                        MbxLauncherWidget(
                            color: ColorX.teal,
                            faIcon: FontAwesomeIcons.mobile,
                            title: 'Prabayar',
                            titleColor: ColorX.white,
                            highlightColor: ColorX.theme.lighten(0.1),
                            clicked: () {
                              controller.btnPrepaidClicked();
                            }),
                        MbxLauncherWidget(
                          color: ColorX.teal,
                          faIcon: FontAwesomeIcons.mobile,
                          title: 'Pascabayar',
                          titleColor: ColorX.white,
                          highlightColor: ColorX.theme.lighten(0.1),
                          clicked: () {
                            controller.btnPascabayarClicked();
                          },
                        ),
                        MbxLauncherWidget(
                          color: ColorX.teal,
                          faIcon: FontAwesomeIcons.mobile,
                          title: 'Paket Data',
                          titleColor: ColorX.white,
                          highlightColor: ColorX.theme.lighten(0.1),
                          clicked: () {
                            controller.btnDataPlanClicked();
                          },
                        ),
                      ],
                    ),
                  ),
                  ContainerX(height: 16.0),
                  ButtonX(
                    title: 'Kembali',
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
            ])));
  }
}
