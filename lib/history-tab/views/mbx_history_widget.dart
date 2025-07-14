import 'package:mbxflutter/utils/all_utils.dart';
import 'package:mbxflutter/utils/mbx_format_vm.dart';

import '../../widget-x/all_widgets.dart';
import '../models/mbx_history_model.dart';

// ignore: must_be_immutable
class MbxHistoryWidget extends StatelessWidget {
  final MbxHistoryModel history;
  MbxHistoryWidget(this.history);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 6.0),
            child: ImageX(
              backgroundColor: ColorX.theme.darken(0.05),
              faIcon: history.amount < 0
                  ? FontAwesomeIcons.arrowUp
                  : FontAwesomeIcons.arrowDown,
              color: ColorX.white,
              width: 24.0,
              height: 24.0,
              cornerRadius: 16.0,
              padding: EdgeInsets.all(4.0),
            ),
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextX(
                        history.title,
                        color: ColorX.black,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    TextX(
                      MbxFormatVM.currencyRP(
                        history.amount,
                        prefix: true,
                        mutation: true,
                        masked: false,
                      ),
                      color: history.amount > 0 ? ColorX.green : ColorX.black,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(height: 2.0),
                TextX(
                  history.description,
                  color: ColorX.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
                SizedBox(height: 2.0),
                TextX(
                  MbxFormatVM.longDateTime(history.created_at),
                  color: ColorX.black,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w400,
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
