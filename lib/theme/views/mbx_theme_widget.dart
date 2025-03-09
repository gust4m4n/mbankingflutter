import '../../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxThemeWidget extends StatelessWidget {
  final Color color;

  MbxThemeWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        child: Center(
            child: InkWellX(
                cornerRadius: 29.0,
                highlightColor: ColorX.highlight,
                clicked: () {
                  final hex = '#${color.value.toRadixString(16)}';
                  Get.back(result: hex);
                },
                child: ContainerX(
                  padding: EdgeInsets.all(4.0),
                  cornerRadius: 29.0,
                  borderWidth: 2.0,
                  borderColor: color.value == ColorX.theme.value
                      ? ColorX.theme
                      : ColorX.transparent,
                  child: ContainerX(
                      width: 50.0,
                      height: 50.0,
                      cornerRadius: 25.0,
                      backgroundColor: color),
                ))));
  }
}
