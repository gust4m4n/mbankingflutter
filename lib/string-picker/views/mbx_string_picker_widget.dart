import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxStringPickerWidget extends StatelessWidget {
  final String title;

  MbxStringPickerWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: TextX(
        title,
        color: ColorX.black,
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        textAlign: TextAlign.start,
        maxLines: 8,
      ),
    );
  }
}
