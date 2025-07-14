import '../../widget-x/all_widgets.dart';
import '../../history-tab/views/mbx_history_page.dart';
import '../../home-tab/views/mbx_home_page.dart';
import '../../notification-tab/views/mbx_notification_page.dart';
import '../../profile-tab/views/mbx_profile_page.dart';
import 'mbx_bottom_navbar_button.dart';
import 'mbx_bottom_navbar_controller.dart';

// ignore: must_be_immutable
class MbxBottomNavBarScreen extends StatelessWidget {
  final int tabBarIndex;
  MbxBottomNavBarScreen({this.tabBarIndex = 0});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxBottomNavBarController>(
        init: MbxBottomNavBarController(tabBarIndex: tabBarIndex),
        builder: (controller) => MbxScreen(
              navigationBarHidden: true,
              body: IndexedStack(
                index: controller.tabBarIndex,
                children: <Widget>[
                  MbxHomePage(),
                  MbxHistoryPage(),
                  ContainerX(backgroundColor: ColorX.white),
                  MbxNotificationPage(),
                  MbxProfilePage(),
                ],
              ),
              floatingActionButton: Stack(children: [
                ContainerX(
                    width: MbxButtonNavBarButton.buttonWidth,
                    height: MbxButtonNavBarButton.buttonWidth,
                    cornerRadius: MbxButtonNavBarButton.buttonWidth / 2.0,
                    backgroundColor: ColorX.white),
                ContainerX(
                    width: MbxButtonNavBarButton.buttonWidth,
                    height: MbxButtonNavBarButton.buttonWidth,
                    cornerRadius: MbxButtonNavBarButton.buttonWidth / 2.0,
                    backgroundColor: ColorX.theme.withOpacity(0.1),
                    child: Center(
                        child: ButtonX(
                      backgroundColor: ColorX.theme,
                      width: 60.0,
                      height: 60.0,
                      cornerRadius: 30.0,
                      faIcon: FontAwesomeIcons.qrcode,
                      faColor: ColorX.white,
                      title: '',
                      clicked: () {
                        controller.btnQRISClicked();
                      },
                    ))),
              ]),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Stack(
                children: [
                  ContainerX(
                      height: 60.0 + MediaQuery.of(Get.context!).padding.bottom,
                      backgroundColor: ColorX.white),
                  ContainerX(
                      height: 60.0 + MediaQuery.of(Get.context!).padding.bottom,
                      backgroundColor: ColorX.theme.withOpacity(0.1)),
                  BottomAppBar(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                    height: 60.0,
                    elevation: 0.0,
                    color: ColorX.transparent,
                    child: Row(
                      children: [
                        Expanded(
                            child: MbxButtonNavBarButton(
                                title: 'Beranda',
                                faIcon: FontAwesomeIcons.house,
                                selected: controller.tabBarIndex == 0,
                                clicked: () {
                                  controller.btnHomeClicked();
                                })),
                        Expanded(
                            child: MbxButtonNavBarButton(
                                title: 'Riwayat',
                                faIcon: FontAwesomeIcons.clockRotateLeft,
                                selected: controller.tabBarIndex == 1,
                                clicked: () {
                                  controller.btnHistoryClicked();
                                })),
                        Expanded(
                            child: ContainerX(
                          width: MbxButtonNavBarButton.buttonWidth,
                        )),
                        Expanded(
                            child: MbxButtonNavBarButton(
                                title: 'Notifikasi',
                                faIcon: FontAwesomeIcons.bell,
                                selected: controller.tabBarIndex == 3,
                                clicked: () {
                                  controller.btnNotificationsClicked();
                                })),
                        Expanded(
                            child: MbxButtonNavBarButton(
                                title: 'Akun',
                                faIcon: FontAwesomeIcons.user,
                                selected: controller.tabBarIndex == 4,
                                clicked: () {
                                  controller.btnAccountClicked();
                                })),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
