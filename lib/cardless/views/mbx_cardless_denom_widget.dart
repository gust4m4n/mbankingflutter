import 'package:mbxflutter/utils/mbx_format_vm.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxCardlessDenomWidget extends StatelessWidget {
  final int nominal;
  final GestureTapCallback? clicked;

  MbxCardlessDenomWidget({required this.nominal, this.clicked = null});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
      highlightColor: ColorX.theme.withOpacity(0.1),
      cornerRadius: 8.0,
      clicked: clicked,
      child: ContainerX(
        backgroundColor: ColorX.theme.withOpacity(0.1),
        cornerRadius: 8.0,
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
