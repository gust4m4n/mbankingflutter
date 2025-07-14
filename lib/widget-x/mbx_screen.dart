import 'all_widgets.dart';

class MbxScreen extends StatelessWidget {
  final String title;
  final GestureTapCallback? backAction;
  final Widget? body;
  final Widget? curvedBody;
  final Widget? scrollingBody;
  final Widget? scrollingFooter;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final bool navigationBarHidden;
  final bool backButtonHidden;
  const MbxScreen({
    Key? key,
    this.title = '',
    this.backAction,
    this.body,
    this.curvedBody,
    this.scrollingBody,
    this.scrollingFooter,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.navigationBarHidden = false,
    this.backButtonHidden = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop == false) {
            if (backAction != null) {
              backAction!();
            } else {
              Get.back();
            }
          }
        },
        child: ScreenX(
            lightStatusBar: true,
            headerView: navigationBarHidden == false
                ? NavigationBarX(
                    title: title,
                    leftBtn: backButtonHidden == false
                        ? ImageX(
                            faIcon: FontAwesomeIcons.arrowLeft,
                            width: 20.0,
                            height: 20.0,
                            color: ColorX.white,
                            fit: BoxFit.contain,
                          )
                        : null,
                    leftAction: () {
                      if (backAction != null) {
                        backAction!();
                      } else {
                        Get.back();
                      }
                    },
                  )
                : null,
            bottomPadding: false,
            bodyView: curvedBody != null
                ? Column(
                    children: [
                      TopContainerX(),
                      Expanded(
                          child: ContainerX(
                        backgroundColor: ColorX.white,
                        child: curvedBody,
                      )),
                    ],
                  )
                : scrollingBody != null
                    ? ContainerX(
                        child: SingleChildScrollView(
                            physics: ClampingScrollPhysics(),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.0,
                                    top: 16.0,
                                    right: 16.0,
                                    bottom: 16.0 +
                                        MediaQuery.of(Get.context!)
                                            .padding
                                            .bottom),
                                child: ContainerX(
                                    backgroundColor: ColorX.white,
                                    cornerRadius: 16.0,
                                    borderWidth: 0.5,
                                    borderColor: ColorX.gray,
                                    padding: EdgeInsets.all(16.0),
                                    child: scrollingBody))))
                    : body != null
                        ? ContainerX(child: body!)
                        : null,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            bottomNavigationBar: bottomNavigationBar));
  }
}
