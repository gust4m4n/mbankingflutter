import 'package:carousel_slider/carousel_slider.dart';
import 'package:mbxflutter/login/views/mbx_onboarding_widget.dart';
import 'package:mbxflutter/widget-x/all_widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../home-tab/views/mbx_theme_button.dart';
import 'mbx_login_controller.dart';

class MbxLoginScreen extends StatelessWidget {
  const MbxLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxLoginController>(
      init: MbxLoginController(),
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
                  InkWellX(
                    cornerRadius: 25.0,
                    clicked: () {
                      controller.btnLanguageClicked();
                    },
                    child: ContainerX(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 8.0,
                      ),
                      borderWidth: 1.0,
                      borderColor: ColorX.white,
                      cornerRadius: 25.0,
                      backgroundColor: ColorX.transparent,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ImageX(
                            faIcon: FontAwesomeIcons.globe,
                            color: ColorX.white,
                            width: 14.0,
                            height: 14.0,
                          ),
                          SizedBox(width: 6.0),
                          TextX(
                            controller.getCurrentLanguageFlag(),
                            fontSize: 16.0,
                          ),
                          SizedBox(width: 6.0),
                          TextX(
                            controller.getCurrentLanguageName(),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500,
                            color: ColorX.white,
                          ),
                        ],
                      ),
                    ),
                  ),
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
                    child: controller.onboardingVM.list.isNotEmpty
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
                      visible: controller.onboardingVM.list.isNotEmpty,
                      child: AnimatedSmoothIndicator(
                        activeIndex: controller.onboardingIndex,
                        count: controller.onboardingVM.list.length,
                        effect: SlideEffect(
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: ColorX.theme.withValues(alpha: 0.2),
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
                      error: controller.phoneError,
                      child: TextFieldX(
                        hint: 'phone_hint'.tr,
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
