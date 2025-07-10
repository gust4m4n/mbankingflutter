import 'package:carousel_slider/carousel_slider.dart';
import 'package:mbxflutter/login/views/mbx_onboarding_widget.dart';
import 'package:mbxflutter/widgets/all_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home-tab/views/mbx_theme_button.dart';
import 'mbx_login_controller.dart';

class MbxLoginScreen extends StatelessWidget {
  MbxLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbLoginController>(
      init: MbLoginController(),
      builder: (controller) => MbxScreen(
        navigationBarHidden: true,
        body: Column(
          children: [
            ContainerX(
              padding: EdgeInsets.only(
                left: 24.0,
                top: MediaQuery.of(Get.context!).padding.top + 12.0,
                right: 24.0,
                bottom: 0.0,
              ),
              child: Row(
                children: [
                  Spacer(),
                  MbxThemeButton(
                    clicked: () {
                      controller.btnThemeClicked();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: controller.onboardingVM.list.length > 0
                        ? CarouselSlider.builder(
                            options: CarouselOptions(
                              scrollPhysics: ClampingScrollPhysics(),
                              padEnds: false,
                              autoPlay: true,
                              viewportFraction: 1.0,
                              height: double.infinity,
                              onPageChanged: (index, reason) {
                                controller.setOnboardingIndex(index);
                              },
                            ),
                            itemCount: controller.onboardingVM.list.length,
                            itemBuilder:
                                (
                                  BuildContext context,
                                  int index,
                                  int pageViewIndex,
                                ) {
                                  return MbxOnboardingWidget(
                                    controller.onboardingVM.list[index],
                                  );
                                },
                          )
                        : Container(),
                  ),
                  ContainerX(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      top: 16.0,
                      right: 24.0,
                      bottom: 16.0,
                    ),
                    child: Visibility(
                      visible: controller.onboardingVM.list.length > 0,
                      child: AnimatedSmoothIndicator(
                        activeIndex: controller.onboardingIndex,
                        count: controller.onboardingVM.list.length,
                        effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: ColorX.theme.withOpacity(0.2),
                          activeDotColor: ColorX.theme,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ContainerX(
              backgroundColor: ColorX.white,
              topLeftRadius: 16.0,
              topRightRadius: 16.0,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ContainerError(
                      child: TextFieldX(
                        hint: 'No. HP (08xxxxxxxxx)',
                        obscureText: false,
                        keyboardType: TextInputType.phone,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        readOnly: false,
                        controller: controller.txtPhoneController,
                        focusNode: controller.txtPhoneNode,
                        onChanged: (value) {
                          controller.txtPhoneOnChanged(value);
                        },
                        rightIcon: ImageX(
                          faIcon: FontAwesomeIcons.arrowRight,
                          color: ColorX.white,
                          width: 14.0,
                          height: 14.0,
                          backgroundColor: ColorX.theme,
                        ),
                        rightAction: () {
                          controller.btnLoginClicked();
                        },
                      ),
                      error: controller.phoneError,
                    ),
                    ContainerX(height: 24.0),
                    TextX(
                      controller.version,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.gray,
                    ),
                    ContainerX(
                      height: MediaQuery.of(Get.context!).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
