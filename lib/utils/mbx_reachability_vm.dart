import '../utils/all_utils.dart';
import '../widgets/all_widgets.dart';

class MbxReachabilityVM {
  static startListening() {
    ReachabilityX.startListening(handler: (connected) {
      if (connected == true) {
        ToastX.snackBarCustom(
          widget: InternetOnlineToast(),
          duration: 4000,
        );
      } else {
        ToastX.snackBarCustom(
          widget: InternetOfflineToast(),
          duration: 0,
        );
      }
    });
  }
}
