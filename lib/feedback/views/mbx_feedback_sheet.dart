import 'package:mbxflutter/feedback/viewmodels/appx_feedback_vm.dart';
import 'package:mbxflutter/feedback/views/mbx_feedback_controller.dart';
import 'package:mbxflutter/feedback/views/mbx_feedback_widget.dart';
import 'package:mbxflutter/utils/all_utils.dart';

import '../../widget-x/all_widgets.dart';

// ignore: must_be_immutable
class MbxFeedbackSheet extends GetWidget<MbxFeedbackController> {
  static void show({required String feature}) async {
    final resp = await AppxFeedbackVM.get(feature: feature);
    if (resp.score == AppxFeedbackScore.notYet) {
      FocusManager.instance.primaryFocus?.unfocus();
      final score = await SheetX.showCustom(
        widget: MbxFeedbackSheet(),
        title: 'Feedback',
      );
      if (score != null) {
        await AppxFeedbackVM.update(feature: feature, score: score);
      } else {
        await AppxFeedbackVM.update(
          feature: feature,
          score: AppxFeedbackScore.notGiven,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxFeedbackController>(
      init: MbxFeedbackController(),
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
                  child: MbxFeedbackWidget(
                    title: 'Sangat Puas',
                    faIcon: FontAwesomeIcons.faceGrinBeam,
                    faColor: ColorX.green.darken(0.1),
                    clicked: () {
                      controller.btnRatingClicked(
                        AppxFeedbackScore.verySatisfied,
                      );
                    },
                  ),
                ),
                Expanded(
                  child: MbxFeedbackWidget(
                    title: 'Puas',
                    faIcon: FontAwesomeIcons.faceSmile,
                    faColor: ColorX.green.lighten(0.1),
                    clicked: () {
                      controller.btnRatingClicked(AppxFeedbackScore.satisfied);
                    },
                  ),
                ),
                Expanded(
                  child: MbxFeedbackWidget(
                    title: 'Biasa Saja',
                    faIcon: FontAwesomeIcons.faceMeh,
                    faColor: ColorX.yellow,
                    clicked: () {
                      controller.btnRatingClicked(AppxFeedbackScore.normal);
                    },
                  ),
                ),
                Expanded(
                  child: MbxFeedbackWidget(
                    title: 'Buruk',
                    faIcon: FontAwesomeIcons.faceFrown,
                    faColor: ColorX.red,
                    clicked: () {
                      controller.btnRatingClicked(AppxFeedbackScore.bad);
                    },
                  ),
                ),
                Expanded(
                  child: MbxFeedbackWidget(
                    title: 'Buruk Sekali',
                    faIcon: FontAwesomeIcons.faceTired,
                    faColor: ColorX.red,
                    clicked: () {
                      controller.btnRatingClicked(AppxFeedbackScore.veryBad);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ContainerX(height: MediaQuery.of(Get.context!).padding.bottom),
          ],
        ),
      ),
    );
  }
}
