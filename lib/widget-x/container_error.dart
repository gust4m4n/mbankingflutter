import 'all_widgets.dart';

class ContainerError extends StatelessWidget {
  final Widget? child;
  final String? error;
  final CrossAxisAlignment align;
  final TextAlign? textAlign;

  const ContainerError({
    super.key,
    this.child,
    this.error,
    this.align = CrossAxisAlignment.start,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (child != null) child!,
        Visibility(
          visible: error != null && error!.isNotEmpty,
          child: Column(
            crossAxisAlignment: align,
            children: [
              ContainerX(height: 4.0),
              TextX(
                error != null ? error! : '',
                color: ColorX.red,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
                textAlign: textAlign,
                maxLines: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
