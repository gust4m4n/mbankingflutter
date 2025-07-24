import 'all_widgets.dart';

extension Loading on GetInterface {
  void loading() {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog(
          elevation: 0.0,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          content: Center(
            child: ContainerX(
                backgroundColor: ColorX.white,
                cornerRadius: 12.0,
                width: 100.0,
                height: 100.0,
                child: Center(
                    child: SizedBox(
                        width: 32.0,
                        height: 32.0,
                        child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(ColorX.black))))),
          ),
        ),
        useSafeArea: false,
        transitionDuration: Duration.zero,
        transitionCurve: null);
  }
}
