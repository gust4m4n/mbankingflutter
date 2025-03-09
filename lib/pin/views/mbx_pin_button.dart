import '../../widgets/all_widgets.dart';

class MbxPinButton extends StatelessWidget {
  final String title;
  final IconData? faIcon;

  final GestureTapCallback? clicked;

  MbxPinButton({
    Key? key,
    this.title = '',
    this.faIcon = null,
    this.clicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: (title.isNotEmpty || faIcon != null)
            ? ButtonX(
                height: 48.0,
                cornerRadius: 8.0,
                backgroundColor: ColorX.theme.withOpacity(1.0),
                highlightColor: ColorX.theme.withOpacity(0.2),
                titleColor: ColorX.white,
                title: title,
                faIcon: faIcon,
                faColor: ColorX.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w400,
                clicked: clicked)
            : ContainerX(height: 48.0));
  }
}
