import '../../widget-x/all_widgets.dart';

class MbxPinButton extends StatelessWidget {
  final String title;
  final IconData? faIcon;

  final GestureTapCallback? clicked;

  const MbxPinButton({super.key, this.title = '', this.faIcon, this.clicked});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: (title.isNotEmpty || faIcon != null)
          ? ButtonX(
              height: 48.0,
              cornerRadius: 8.0,
              backgroundColor: ColorX.white,
              highlightColor: ColorX.lightGray,
              titleColor: ColorX.theme,
              title: title,
              faIcon: faIcon,
              faColor: ColorX.theme,
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              clicked: clicked,
            )
          : ContainerX(height: 48.0),
    );
  }
}
