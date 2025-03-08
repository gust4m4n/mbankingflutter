import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class AppxFeedbackWidget extends StatelessWidget {
  final String title;
  final IconData faIcon;
  final Color faColor;
  final GestureTapCallback clicked;
  AppxFeedbackWidget(
      {required this.title,
      required this.faIcon,
      required this.faColor,
      required this.clicked});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        clicked: clicked,
        cornerRadius: 8.0,
        child: Padding(
            padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Column(
              children: [
                ImageX(
                  faIcon: faIcon,
                  width: 42.0,
                  height: 42.0,
                  color: faColor,
                ),
                SizedBox(height: 8.0),
                TextX(
                  title,
                  color: Colors.black,
                  fontSize: 12.0,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ],
            )));
  }
}
