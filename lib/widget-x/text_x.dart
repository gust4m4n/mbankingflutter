import 'all_widgets.dart';

class TextX extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  final bool underline;
  final int maxLines;

  const TextX(
    this.text, {
    super.key,
    this.color = ColorX.black,
    this.fontSize = 17.0,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.underline = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
