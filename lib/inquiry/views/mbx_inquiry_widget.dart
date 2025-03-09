import '../../models/mbx_label_value_model.dart';
import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxInquiryWidget extends StatelessWidget {
  final MbxLabelValueModel row;

  MbxInquiryWidget({required this.row});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.0, top: 4.0, right: 16.0, bottom: 4.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    row.label.toUpperCase(),
                    color: ColorX.black,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                  TextX(
                    row.value,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                    maxLines: 8,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
