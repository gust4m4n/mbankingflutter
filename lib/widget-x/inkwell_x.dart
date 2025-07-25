import 'all_widgets.dart';

class InkWellX extends StatelessWidget {
  final Color? backgroundColor;
  final Color? highlightColor;
  final double cornerRadius;
  final GestureTapCallback? clicked;
  final Widget? child;

  const InkWellX({
    super.key,
    this.backgroundColor = ColorX.transparent,
    this.highlightColor,
    this.cornerRadius = 0.0,
    this.clicked,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
      ),
      child: InkWell(
        splashFactory: NoSplash.splashFactory,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        highlightColor: highlightColor,
        onTap: () {
          if (clicked != null) {
            clicked!();
          }
        },
        child: child,
      ),
    );
  }
}
