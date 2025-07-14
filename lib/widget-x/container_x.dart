import 'all_widgets.dart';

class ContainerX extends StatelessWidget {
  final Color? backgroundColor;
  final Color? gradientColorBegin;
  final Color? gradientColorEnd;
  final double? width;
  final double? height;
  final double borderWidth;
  final Color borderColor;
  final double cornerRadius;
  final double topLeftRadius;
  final double topRightRadius;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Clip clipBehavior;
  final Color shadowColor;
  final double shadowSpreadRadius;
  final double shadowBlurRadius;
  final Offset shadowOffset;
  final Widget? child;

  const ContainerX({
    Key? key,
    this.backgroundColor = ColorX.transparent,
    this.gradientColorBegin = null,
    this.gradientColorEnd = null,
    this.width,
    this.height,
    this.borderWidth = 0.0,
    this.borderColor = ColorX.transparent,
    this.cornerRadius = 0.0,
    this.topLeftRadius = 0.0,
    this.topRightRadius = 0.0,
    this.padding = const EdgeInsets.all(0.0),
    this.margin = const EdgeInsets.all(0.0),
    this.clipBehavior = Clip.antiAlias,
    this.shadowColor = ColorX.transparent,
    this.shadowSpreadRadius = 0.0,
    this.shadowBlurRadius = 0.0,
    this.shadowOffset = const Offset(0.0, 0.0),
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: (gradientColorBegin == null || gradientColorEnd == null)
            ? backgroundColor
            : null,
        gradient: (gradientColorBegin != null && gradientColorEnd != null)
            ? LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                    0.1,
                    1.0
                  ],
                colors: [
                    gradientColorBegin!,
                    gradientColorEnd!,
                  ])
            : null,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
                topLeftRadius > 0.0 ? topLeftRadius : cornerRadius),
            topRight: Radius.circular(
                topRightRadius > 0.0 ? topLeftRadius : cornerRadius),
            bottomLeft: Radius.circular(cornerRadius),
            bottomRight: Radius.circular(cornerRadius)),
        border: Border.all(
          width: borderWidth,
          color: borderWidth == 0.0
              ? backgroundColor ?? Colors.transparent
              : borderColor,
        ),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            spreadRadius: shadowSpreadRadius,
            blurRadius: shadowBlurRadius,
            offset: shadowOffset,
          ),
        ],
      ),
      child: child,
    );
  }
}
