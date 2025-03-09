import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxThemeButton extends StatelessWidget {
  final GestureTapCallback? clicked;
  MbxThemeButton({required this.clicked});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
      cornerRadius: 8.0,
      clicked: clicked,
      child: ContainerX(
        width: 42.0,
        height: 42.0,
        cornerRadius: 12.0,
        child: Center(
            child: ContainerX(
          backgroundColor: ColorX.theme,
          width: 32.0,
          height: 32.0,
          cornerRadius: 16.0,
          borderWidth: 4.0,
          borderColor: ColorX.white,
        )),
      ),
    );
  }
}
