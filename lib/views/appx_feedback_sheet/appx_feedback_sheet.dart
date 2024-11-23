import 'package:mbankingflutter/utils/all_utils.dart';
import 'package:mbankingflutter/views/appx_feedback_sheet/appx_feedback_widget.dart';

import '../../viewmodels/appx_feedback_vm.dart';
import '../../widgets/all_widgets.dart';
import 'appx_feedback_controller.dart';

// ignore: must_be_immutable
class AppxFeedbackSheet extends GetWidget<AppxFeedbackController> {
  static void show({required String feature}) async {
    final resp = await AppxFeedbackVM.get(feature: feature);
    if (resp.score == AppxFeedbackScore.notYet) {
      FocusManager.instance.primaryFocus?.unfocus();
      final score = await SheetX.showCustom(
        widget: AppxFeedbackSheet(),
        title: 'Feedback',
      );
      if (score != null) {
        await AppxFeedbackVM.update(feature: feature, score: score);
      } else {
        await AppxFeedbackVM.update(
            feature: feature, score: AppxFeedbackScore.notGiven);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppxFeedbackController>(
        init: AppxFeedbackController(),
        builder: (controller) => Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                TextX(
                  'Seberapa puas Anda dengan fitur ini ?',
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 2048,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: AppxFeedbackWidget(
                            title: 'Sangat Puas',
                            faIcon: FontAwesomeIcons.faceGrinBeam,
                            faColor: ColorX.green.darken(0.1),
                            onClicked: () {
                              controller.btnRatingClicked(
                                  AppxFeedbackScore.verySatisfied);
                            })),
                    Expanded(
                      child: AppxFeedbackWidget(
                          title: 'Puas',
                          faIcon: FontAwesomeIcons.faceSmile,
                          faColor: ColorX.green.lighten(0.1),
                          onClicked: () {
                            controller
                                .btnRatingClicked(AppxFeedbackScore.satisfied);
                          }),
                    ),
                    Expanded(
                      child: AppxFeedbackWidget(
                          title: 'Biasa Saja',
                          faIcon: FontAwesomeIcons.faceMeh,
                          faColor: ColorX.yellow,
                          onClicked: () {
                            controller
                                .btnRatingClicked(AppxFeedbackScore.normal);
                          }),
                    ),
                    Expanded(
                      child: AppxFeedbackWidget(
                          title: 'Buruk',
                          faIcon: FontAwesomeIcons.faceFrown,
                          faColor: ColorX.red,
                          onClicked: () {
                            controller.btnRatingClicked(AppxFeedbackScore.bad);
                          }),
                    ),
                    Expanded(
                      child: AppxFeedbackWidget(
                          title: 'Buruk Sekali',
                          faIcon: FontAwesomeIcons.faceTired,
                          faColor: ColorX.red,
                          onClicked: () {
                            controller
                                .btnRatingClicked(AppxFeedbackScore.veryBad);
                          }),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                ContainerX(height: MediaQuery.of(Get.context!).padding.bottom)
              ],
            )));
  }
}
