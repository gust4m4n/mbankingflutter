import 'package:mbxflutter/transfer/main/viewmodels/mbx_transfer_history_model.dart';
import 'package:mbxflutter/utils/mbx_format_vm.dart';

import '../../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxTransferHistoryWidget extends StatelessWidget {
  final MbxTransferHistoryModel history;
  final GestureTapCallback? onTransferClicked;

  MbxTransferHistoryWidget({
    required this.history,
    required this.onTransferClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextX(
                  history.name,
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w700,
                  textAlign: TextAlign.start,
                  maxLines: 8,
                ),
                TextX(
                  '${history.bank} - ${history.account}',
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 8,
                ),
                Row(
                  children: [
                    TextX(
                      MbxFormatVM.currencyRP(
                        history.amount,
                        prefix: true,
                        mutation: false,
                        masked: false,
                      ),
                      color: ColorX.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      maxLines: 8,
                    ),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextX(
                        MbxFormatVM.longDateTime(history.date),
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.start,
                        maxLines: 8,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                ButtonX(
                  title: 'Transfer',
                  titleColor: ColorX.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700,
                  backgroundColor: ColorX.transparent,
                  borderWidth: 0.5,
                  borderColor: ColorX.gray,
                  width: 100.0,
                  height: 32.0,
                  cornerRadius: 8.0,
                  clicked: onTransferClicked,
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          ContainerX(width: 8.0),
          ImageX(
            faIcon: FontAwesomeIcons.chevronRight,
            width: 13.0,
            height: 13.0,
            color: ColorX.black,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
