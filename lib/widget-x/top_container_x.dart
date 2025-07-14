import 'all_widgets.dart';

class TopContainerX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorX.theme,
      width: double.infinity,
      height: 16.0,
      child: Container(
        decoration: BoxDecoration(
            color: ColorX.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0)),
            border: Border.all(
              width: 0.0,
              color: ColorX.white,
            )),
      ),
    );
  }
}
