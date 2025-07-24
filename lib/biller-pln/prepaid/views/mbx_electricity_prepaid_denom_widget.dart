import 'package:mbxflutter/utils/mbx_format_vm.dart';

import '../../../widget-x/all_widgets.dart';

// ignore: must_be_immutable
class MbxElectricityPrepaidDenomWidget extends StatelessWidget {
  final int nominal;
  final bool selected;
  final GestureTapCallback? clicked;

  const MbxElectricityPrepaidDenomWidget({
    super.key,
    required this.nominal,
    required this.selected,
    this.clicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellX(
      highlightColor: ColorX.theme.withValues(alpha: 0.1),
      cornerRadius: 8.0,
      clicked: clicked,
      child: ContainerX(
        backgroundColor: selected
            ? ColorX.theme.withValues(alpha: 0.2)
            : ColorX.theme.withValues(alpha: 0.1),
        cornerRadius: 8.0,
        borderWidth: selected ? 1.0 : 0.0,
        borderColor: selected ? ColorX.theme : ColorX.transparent,
        child: Center(
          child: TextX(
            MbxFormatVM.currencyRP(
              nominal,
              prefix: false,
              mutation: false,
              masked: false,
            ),
            color: ColorX.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
