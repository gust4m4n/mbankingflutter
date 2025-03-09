import 'package:mbankingflutter/notification-page/models/mbx_notification_model.dart';
import 'package:mbankingflutter/utils/mbx_format_vm.dart';

import '../../widgets/all_widgets.dart';

// ignore: must_be_immutable
class MbxNotificationWidget extends StatelessWidget {
  final MbxNotificationModel notification;
  MbxNotificationWidget(this.notification);

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        borderWidth: 0.5,
        borderColor: ColorX.gray,
        cornerRadius: 16.0,
        padding:
            EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: ImageX(
                backgroundColor:
                    notification.readed ? ColorX.lightGray : ColorX.theme,
                faIcon: FontAwesomeIcons.solidBell,
                color: notification.readed ? ColorX.white : ColorX.white,
                width: 24.0,
                height: 24.0,
                padding: EdgeInsets.all(4.0),
                cornerRadius: 16.0,
              ),
            ),
            SizedBox(width: 12.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextX(
                    notification.title,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                  SizedBox(height: 2.0),
                  TextX(
                    notification.description,
                    color: ColorX.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    textAlign: TextAlign.start,
                    maxLines: 3,
                  ),
                  SizedBox(height: 2.0),
                  TextX(
                    MbxFormatVM.longDateTime(notification.created_at),
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
        ));
  }
}
