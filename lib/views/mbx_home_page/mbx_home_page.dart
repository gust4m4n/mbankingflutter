import 'package:carousel_slider/carousel_slider.dart';
import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/utils/all_utils.dart';
import 'package:mbankingflutter/viewmodels/mbx_news_list_vm.dart';
import 'package:mbankingflutter/views/mbx_home_page/mbx_foreign_exchange_widget.dart';
import 'package:mbankingflutter/views/mbx_home_page/mbx_news_widget.dart';
import 'package:mbankingflutter/views/mbx_home_page/mbx_theme_button.dart';
import 'package:mbankingflutter/views/mbx_sof_sheet/mbx_sof_widget.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_home_controller.dart';
import 'mbx_launcher_widget.dart';

class MbxHomePage extends StatelessWidget {
  MbxHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxHomeController>(
        init: MbxHomeController(),
        builder: (controller) => Column(children: [
              ContainerX(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      left: 24.0, top: 12.0, right: 24.0, bottom: 12.0),
                  child: Column(
                    children: [
                      SizedBox(height: MediaQuery.of(Get.context!).padding.top),
                      Row(
                        children: [
                          ContainerX(
                              backgroundColor: ColorX.white,
                              width: 46.0,
                              height: 46.0,
                              cornerRadius: 23.0,
                              child: Center(
                                  child: ImageX(
                                faIcon: MbxProfileVM.profile.photo.isEmpty
                                    ? FontAwesomeIcons.user
                                    : null,
                                color: MbxProfileVM.profile.photo.isEmpty
                                    ? ColorX.gray
                                    : null,
                                url: MbxProfileVM.profile.photo,
                                width: MbxProfileVM.profile.photo.isEmpty
                                    ? 20.0
                                    : 40.0,
                                height: 40.0,
                                cornerRadius: 20.0,
                              ))),
                          SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextX(
                                MbxProfileVM.profile.name.isEmpty
                                    ? '-'
                                    : MbxProfileVM.profile.name,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w700,
                                color: ColorX.white,
                              ),
                              ContainerX(height: 2.0),
                              TextX(
                                MbxProfileVM.profile.phone.isEmpty
                                    ? '-'
                                    : MbxProfileVM.profile.phone,
                                fontSize: 13.0,
                                fontWeight: FontWeight.w400,
                                color: ColorX.white,
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            children: [
                              MbxThemeButton(
                                clicked: () {
                                  controller.btnThemeClicked();
                                },
                              ),
                              ButtonX(
                                backgroundColor: ColorX.transparent,
                                faIcon: FontAwesomeIcons.powerOff,
                                faColor: ColorX.white,
                                title: '',
                                width: 42.0,
                                height: 42.0,
                                clicked: () {
                                  controller.btnLockClicked();
                                },
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
              ContainerX(
                backgroundColor: ColorX.theme,
                width: double.infinity,
                height: 16.0,
                child: ContainerX(
                    backgroundColor: ColorX.white,
                    topLeftRadius: 16.0,
                    topRightRadius: 16.0),
              ),
              Expanded(
                child: ContainerX(
                  backgroundColor: ColorX.white,
                  child: Scrollbar(
                      controller: controller.scrollController,
                      child: ListView(
                          controller: controller.scrollController,
                          padding: EdgeInsets.zero,
                          physics: ClampingScrollPhysics(),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0,
                                      top: 0.0,
                                      right: 16.0,
                                      bottom: 4.0),
                                  child: TextX(
                                    'REKENING',
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w700,
                                    color: ColorX.black,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                SizedBox(
                                    height: 84.0,
                                    child: ListView.separated(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        physics: ClampingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) {
                                          return ContainerX(width: 8.0);
                                        },
                                        itemCount: MbxProfileVM
                                            .profile.accounts.length,
                                        itemBuilder: (context, index) {
                                          return ContainerX(
                                              width: 230.0,
                                              child: MbxSofWidget(
                                                account: MbxProfileVM
                                                    .profile.accounts[index],
                                                borders: true,
                                                onEyeClicked: () {
                                                  controller
                                                      .btnEyeClicked(index);
                                                },
                                                clicked: () {},
                                              ));
                                        })),
                                SizedBox(height: 12.0),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0, top: 4.0, right: 16.0),
                                  child: ContainerX(
                                    backgroundColor: ColorX.theme,
                                    cornerRadius: 12.0,
                                    child: GridView.count(
                                      shrinkWrap: true,
                                      mainAxisSpacing: 0.0,
                                      crossAxisSpacing: 0.0,
                                      childAspectRatio: 1.0,
                                      crossAxisCount: 4,
                                      padding: EdgeInsets.all(12.0),
                                      physics: ClampingScrollPhysics(),
                                      children: [
                                        MbxLauncherWidget(
                                            color: ColorX.green,
                                            faIcon: FontAwesomeIcons
                                                .arrowRightArrowLeft,
                                            title: 'Transfer',
                                            titleColor: ColorX.white,
                                            highlightColor:
                                                ColorX.theme.lighten(0.1),
                                            clicked: () {
                                              controller.btnTransferClicked();
                                            }),
                                        MbxLauncherWidget(
                                          color: ColorX.blue,
                                          faIcon: FontAwesomeIcons.sackDollar,
                                          title: 'Tarik Tunai',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                          clicked: () {
                                            controller.btnCardlessClicked();
                                          },
                                        ),
                                        MbxLauncherWidget(
                                          color: ColorX.red,
                                          faIcon: FontAwesomeIcons.qrcode,
                                          title: 'QRIS',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                          clicked: () {
                                            controller.btnQRISClicked();
                                          },
                                        ),
                                        MbxLauncherWidget(
                                          color: ColorX.yellow,
                                          faIcon:
                                              FontAwesomeIcons.solidLightbulb,
                                          title: 'Listrik PLN',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                          clicked: () {
                                            controller.btnElectricityClicked();
                                          },
                                        ),
                                        MbxLauncherWidget(
                                          color: ColorX.teal,
                                          faIcon: FontAwesomeIcons.mobile,
                                          title: 'Pulsa',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                          clicked: () {
                                            controller.btnPulsaClicked();
                                          },
                                        ),
                                        MbxLauncherWidget(
                                          color: ColorX.red,
                                          faIcon: FontAwesomeIcons.landmark,
                                          title: 'PBB',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                          clicked: () {
                                            controller.btnPBBClicked();
                                          },
                                        ),
                                        MbxLauncherWidget(
                                            color: ColorX.yellow,
                                            faIcon: FontAwesomeIcons.water,
                                            title: 'PDAM',
                                            titleColor: ColorX.white,
                                            highlightColor:
                                                ColorX.theme.lighten(0.1),
                                            clicked: () {
                                              controller.btnPDAMClicked();
                                            }),
                                        MbxLauncherWidget(
                                          color: ColorX.gray,
                                          faIcon: FontAwesomeIcons.ellipsis,
                                          title: 'Lainnya',
                                          titleColor: ColorX.white,
                                          highlightColor:
                                              ColorX.theme.lighten(0.1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Visibility(
                                  visible: !controller
                                      .foreignExchangeListVM.list.isEmpty,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            top: 8.0,
                                            right: 16.0,
                                            bottom: 4.0),
                                        child: TextX(
                                          'KURS MATA UANG',
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700,
                                          color: ColorX.black,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0, right: 16.0),
                                        child: ContainerX(
                                            backgroundColor: ColorX.white,
                                            borderColor: ColorX.gray,
                                            borderWidth: 0.5,
                                            cornerRadius: 12.0,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 12.0,
                                                      top: 12.0,
                                                      right: 12.0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                          child: TextX(
                                                        'Mata Uang',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorX.black,
                                                      )),
                                                      ContainerX(width: 8.0),
                                                      Expanded(
                                                          child: TextX(
                                                        'Beli',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorX.black,
                                                      )),
                                                      ContainerX(width: 8.0),
                                                      Expanded(
                                                          child: TextX(
                                                        'Jual',
                                                        fontSize: 15.0,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: ColorX.black,
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                                ListView.builder(
                                                  physics:
                                                      ClampingScrollPhysics(),
                                                  padding: EdgeInsets.only(
                                                      left: 12.0,
                                                      top: 4.0,
                                                      right: 12.0,
                                                      bottom: 12.0),
                                                  shrinkWrap: true,
                                                  itemCount: controller
                                                      .foreignExchangeListVM
                                                      .list
                                                      .length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return MbxForeignExchangeWidget(
                                                        controller
                                                            .foreignExchangeListVM
                                                            .list[index]);
                                                  },
                                                )
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Visibility(
                                  visible: MbxNewsListVM.list.length > 0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 16.0,
                                            top: 8.0,
                                            right: 16.0,
                                            bottom: 4.0),
                                        child: TextX(
                                          'BERITA',
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w700,
                                          color: ColorX.black,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      CarouselSlider.builder(
                                          options: CarouselOptions(
                                            padEnds: false,
                                            autoPlay: true,
                                            viewportFraction: 0.70,
                                            height: 150.0,
                                            onPageChanged: (index, reason) {},
                                          ),
                                          itemCount: MbxNewsListVM.list.length,
                                          itemBuilder: (BuildContext context,
                                              int index, int pageViewIndex) {
                                            return MbxNewsWidget(
                                                MbxNewsListVM.list[index]);
                                          }),
                                    ],
                                  ),
                                ),
                                ContainerX(
                                    height: MediaQuery.of(Get.context!)
                                            .padding
                                            .bottom +
                                        60.0 +
                                        30.0 +
                                        12.0)
                              ],
                            )
                          ])),
                ),
              )
            ]));
  }
}
