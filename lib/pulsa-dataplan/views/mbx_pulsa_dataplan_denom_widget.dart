import 'package:mbankingflutter/pulsa-dataplan/models/mbx_pulsa_dataplan_denom_model.dart';
import 'package:mbankingflutter/utils/mbx_format_vm.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxPulsaDataPlanDenomWidget extends StatelessWidget {
  final MbxPulsaDataPlanDenomModel denom;
  final bool selected;
  final GestureTapCallback? clicked;

  MbxPulsaDataPlanDenomWidget(
      {required this.denom, required this.selected, this.clicked = null});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: ColorX.theme.withOpacity(0.1),
        cornerRadius: 8.0,
        clicked: clicked,
        child: ContainerX(
            backgroundColor: selected
                ? ColorX.theme.withOpacity(0.2)
                : ColorX.theme.withOpacity(0.1),
            cornerRadius: 8.0,
            borderWidth: selected ? 1.0 : 0.0,
            borderColor: selected ? ColorX.theme : ColorX.transparent,
            padding:
                EdgeInsets.only(left: 12.0, top: 4.0, right: 12.0, bottom: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextX(
                  denom.name,
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
                TextX(
                  MbxFormatVM.currencyRP(denom.price,
                      prefix: true, mutation: false, masked: false),
                  color: ColorX.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              ],
            )));
  }
}
