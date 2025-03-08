import '../widgets/all_widgets.dart';

class MbxPinDot extends StatelessWidget {
  final bool on;
  final String number;
  final bool secure;

  MbxPinDot({Key? key, this.on = false, this.number = '', this.secure = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return secure
        ? ContainerX(
            backgroundColor: on ? ColorX.gray : ColorX.transparent,
            width: 12.0,
            height: 12,
            cornerRadius: 6.0,
            borderWidth: 1.0,
            borderColor: ColorX.gray,
          )
        : ContainerX(
            backgroundColor: ColorX.transparent,
            width: 32.0,
            height: 32.0,
            cornerRadius: 8.0,
            borderWidth: 1.0,
            borderColor: ColorX.gray,
            child: Center(
                child: TextX(
              number,
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            )),
          );
  }
}
