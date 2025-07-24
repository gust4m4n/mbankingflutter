import 'all_widgets.dart';

class NavigationBarX extends StatelessWidget {
  final String? title;
  final Widget? leftBtn;
  final GestureTapCallback? leftAction;
  final Widget? rightBtn;
  final GestureTapCallback? rightAction;
  const NavigationBarX(
      {super.key,
      this.title,
      this.leftBtn,
      this.leftAction,
      this.rightBtn,
      this.rightAction});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
        backgroundColor: ColorX.theme,
        height: double.infinity,
        child: Column(children: [
          SizedBox(
            height: MediaQuery.of(Get.context!).padding.top,
          ),
          Expanded(
            child: ContainerX(
                child: Material(
              color: ColorX.theme,
              child: Row(
                children: [
                  leftBtn != null
                      ? InkWellX(
                          clicked: () =>
                              leftAction != null ? leftAction!() : null,
                          child: ContainerX(
                              width: 60.0,
                              height: double.infinity,
                              child: Center(child: leftBtn!)),
                        )
                      : const SizedBox(width: 60.0, height: double.infinity),
                  Expanded(
                    child: TextX(
                      title ?? '',
                      color: ColorX.white,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ),
                  rightBtn != null
                      ? InkWellX(
                          clicked: () =>
                              rightAction != null ? rightAction!() : null,
                          child: ContainerX(
                              width: 60.0,
                              height: double.infinity,
                              child: Center(child: rightBtn!)),
                        )
                      : const SizedBox(width: 60.0, height: double.infinity),
                ],
              ),
            )),
          )
        ]));
  }
}
