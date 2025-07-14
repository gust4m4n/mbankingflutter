import '../../widget-x/all_widgets.dart';
import '../../widget-x/media_x.dart';

// ignore: must_be_immutable
class MbxButtonNavBarButton extends StatelessWidget {
  static final buttonWidth = MediaX.width / 5.0;

  final String title;
  final IconData faIcon;
  final bool selected;
  final GestureTapCallback? clicked;

  MbxButtonNavBarButton({
    required this.title,
    required this.faIcon,
    required this.selected,
    required this.clicked,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: selected
          ? ColorX.theme.withOpacity(0.2)
          : ColorX.transparent, // ColorX.theme.withOpacity(0.1),
      child: InkWellX(
          highlightColor: ColorX.theme.withOpacity(0.2),
          clicked: () {
            clicked!();
          },
          child: ContainerX(
              //width: double.infinity,
              child: Center(
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ImageX(
                  faIcon: faIcon,
                  height: 20.0,
                  width: 20.0,
                  color: selected ? ColorX.black : ColorX.gray,
                ),
                SizedBox(height: 2.0),
                TextX(
                  title,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500,
                  color: selected ? ColorX.black : ColorX.gray,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ))),
    );
  }
}
