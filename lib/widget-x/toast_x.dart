import 'all_widgets.dart';

class ToastX {
  static FlashController? controller;

  static showSuccess({required String msg}) {
    ToastX.snackBarCustom(
      widget: BasicToast(
          backgroundColor: ColorX.green, textColor: ColorX.white, msg: msg),
      duration: 4000,
    );
  }

  static showError({required String msg}) {
    ToastX.snackBarCustom(
      widget: BasicToast(
          backgroundColor: ColorX.red, textColor: ColorX.white, msg: msg),
      duration: 4000,
    );
  }

  static snackBar({required String msg}) {
    ToastX.snackBarCustom(
      widget: BasicSnackBar(msg: msg),
      duration: 4000,
    );
  }

  static snackBarCustom(
      {required Widget widget,
      required int duration,
      bool force = true}) async {
    if (ToastX.controller != null) {
      if (force == true) {
        await ToastX.dismissCustom();
      } else {
        return;
      }
    }
    ToastX.controller = await showFlash(
        context: Get.context!,
        duration: duration == 0 ? null : Duration(milliseconds: duration),
        barrierDismissible: true,
        builder: (context, controller) {
          ToastX.controller = controller;
          return FlashBar(
            shadowColor: ColorX.transparent,
            backgroundColor: ColorX.transparent,
            controller: controller,
            elevation: 0.0,
            behavior: FlashBehavior.floating,
            position: FlashPosition.bottom,
            padding: EdgeInsets.all(0.0),
            dismissDirections: const [FlashDismissDirection.vertical],
            content: widget,
          );
        });
    ToastX.controller = null;
  }

  static dismissCustom() async {
    await ToastX.controller?.dismiss();
    ToastX.controller = null;
  }
}

class BasicToast extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String msg;
  BasicToast(
      {required this.backgroundColor,
      required this.textColor,
      required this.msg});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.transparent,
      padding: EdgeInsets.all(32.0),
      child: Center(
        child: ContainerX(
          backgroundColor: backgroundColor,
          padding:
              EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
          cornerRadius: 16.0,
          child: Wrap(children: [
            TextX(
              msg,
              color: textColor,
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              maxLines: 16,
            ),
          ]),
        ),
      ),
    );
  }
}

class BasicSnackBar extends StatelessWidget {
  final String msg;
  BasicSnackBar({required this.msg});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.theme,
      padding: EdgeInsets.only(left: 16.0, top: 8.0, right: 16.0, bottom: 8.0),
      child: Wrap(children: [
        TextX(
          msg,
          color: ColorX.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          textAlign: TextAlign.start,
          maxLines: 16,
        ),
      ]),
    );
  }
}
