import 'mbx_onboarding_model.dart';
import '../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxOnboardingWidget extends StatelessWidget {
  final MbxOnboardingModel onboarding;
  MbxOnboardingWidget(this.onboarding);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        padding: EdgeInsets.all(24.0),
        child: Center(
            child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ImageX(
              url: onboarding.image,
              height: 320.0,
              width: 320.0,
              fit: BoxFit.contain,
            ),
            ContainerX(height: 16.0),
            TextX(
              onboarding.title,
              color: ColorX.black,
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
              textAlign: TextAlign.center,
              maxLines: 8,
            ),
            ContainerX(height: 4.0),
            TextX(
              onboarding.description,
              color: ColorX.black,
              fontSize: 17.0,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              maxLines: 8,
            ),
          ],
        )));
  }
}
