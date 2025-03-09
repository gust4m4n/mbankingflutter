import 'package:mbankingflutter/home-tab/models/mbx_foreign_exchange_model.dart';
import 'package:mbankingflutter/utils/mbx_format_vm.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxForeignExchangeWidget extends StatelessWidget {
  final MbxForeignExchangeModel model;
  MbxForeignExchangeWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: TextX(
          model.currency,
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: ColorX.black,
        )),
        ContainerX(width: 8.0),
        Expanded(
            child: TextX(
          MbxFormatVM.foreignExchange(value: model.buy),
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: ColorX.black,
        )),
        ContainerX(width: 8.0),
        Expanded(
            child: TextX(
          MbxFormatVM.foreignExchange(value: model.sell),
          fontSize: 15.0,
          fontWeight: FontWeight.w400,
          color: ColorX.black,
        )),
      ],
    );
  }
}
