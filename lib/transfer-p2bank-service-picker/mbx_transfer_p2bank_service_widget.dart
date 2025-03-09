import 'package:mbankingflutter/models/mbx_transfer_p2bank_service_model.dart';
import 'package:mbankingflutter/utils/all_utils.dart';

import '../viewmodels/mbx_format_vm.dart';
import '../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxTransferP2BankServiceWidget extends StatelessWidget {
  final MbxTransferP2BankServiceModel service;
  final bool borders;
  final GestureTapCallback? onEyeClicked;
  final GestureTapCallback? clicked;

  MbxTransferP2BankServiceWidget(
      {required this.service,
      required bool this.borders,
      required this.onEyeClicked,
      this.clicked});

  @override
  Widget build(BuildContext context) {
    return InkWellX(
        highlightColor: clicked != null
            ? ColorX.theme.withOpacity(0.1)
            : ColorX.transparent,
        cornerRadius: clicked != null ? 12.0 : 0.0,
        clicked: clicked,
        child: ContainerX(
            backgroundColor: ColorX.transparent,
            borderWidth: 1.0,
            borderColor: borders ? ColorX.lightGray : ColorX.transparent,
            cornerRadius: borders ? 12.0 : 0.0,
            padding: borders
                ? EdgeInsets.only(
                    left: 12.0, top: 8.0, right: 12.0, bottom: 8.0)
                : EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ContainerX(
                  backgroundColor: ColorX.theme.darken(0.03),
                  padding: EdgeInsets.only(
                      left: 8.0, top: 2.0, right: 8.0, bottom: 2.0),
                  cornerRadius: 6.0,
                  child: TextX(
                    service.name,
                    color: ColorX.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                  ),
                ),
                ContainerX(height: 8.0),
                Row(
                  children: [
                    Expanded(
                      child: TextX(
                        'Minimal Transaksi',
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ContainerX(width: 8.0),
                    Expanded(
                      child: TextX(
                        MbxFormatVM.currencyRP(service.minimum,
                            prefix: true, mutation: false, masked: false),
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextX(
                        'Biaya',
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    ContainerX(width: 8.0),
                    Expanded(
                      child: TextX(
                        MbxFormatVM.currencyRP(service.fee,
                            prefix: true, mutation: false, masked: false),
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
