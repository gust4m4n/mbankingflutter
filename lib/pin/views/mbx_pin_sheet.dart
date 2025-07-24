import '../../widget-x/all_widgets.dart';
import 'mbx_pin_button.dart';
import 'mbx_pin_controller.dart';
import 'mbx_pin_dot.dart';

// ignore: must_be_immutable
class MbxPinSheet extends GetWidget<MbxPinController> {
  String title = '';
  String message = '';
  bool secure = true;
  bool biometric = false;
  void Function(String code, bool biometric)? onSubmit = null;
  String optionTitle = 'Lupa PIN';
  void Function()? optionClicked = null;

  MbxPinSheet();

  Future<T?> show<T>({
    required String title,
    required String message,
    required bool secure,
    required bool biometric,
    required void Function(String code, bool biometric) onSubmit,
    required String optionTitle,
    required void Function()? optionClicked,
  }) async {
    FocusManager.instance.primaryFocus?.unfocus();
    await Get.delete<MbxPinController>();
    this.title = title;
    this.message = message;
    this.secure = secure;
    this.biometric = biometric;
    this.onSubmit = onSubmit;
    this.optionTitle = optionTitle;
    this.optionClicked = optionClicked;
    return SheetX.showCustom(widget: this, title: title, autoClose: false);
  }

  clear(String error) {
    final controller = Get.find<MbxPinController>();
    controller.clear(error);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPinController>(
        init: MbxPinController(widget: this),
        builder: (controller) => ContainerX(
            backgroundColor: ColorX.white,
            child: Wrap(alignment: WrapAlignment.center, children: [
              Visibility(
                visible: message.isNotEmpty,
                child: Padding(
                  padding: EdgeInsets.only(left: 48.0, right: 48.0),
                  child: TextX(
                    message,
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
              ),
              ContainerX(height: 16.0),
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: ContainerError(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MbxPinDot(
                        on: controller.code.length >= 1,
                        number: controller.code.length >= 1
                            ? controller.code[0]
                            : '',
                        secure: secure,
                      ),
                      ContainerX(width: 8.0),
                      MbxPinDot(
                        on: controller.code.length >= 2,
                        number: controller.code.length >= 2
                            ? controller.code[1]
                            : '',
                        secure: secure,
                      ),
                      ContainerX(width: 8.0),
                      MbxPinDot(
                        on: controller.code.length >= 3,
                        number: controller.code.length >= 3
                            ? controller.code[2]
                            : '',
                        secure: secure,
                      ),
                      ContainerX(width: 8.0),
                      MbxPinDot(
                        on: controller.code.length >= 4,
                        number: controller.code.length >= 4
                            ? controller.code[3]
                            : '',
                        secure: secure,
                      ),
                      ContainerX(width: 8.0),
                      MbxPinDot(
                        on: controller.code.length >= 5,
                        number: controller.code.length >= 5
                            ? controller.code[4]
                            : '',
                        secure: secure,
                      ),
                      ContainerX(width: 8.0),
                      MbxPinDot(
                        on: controller.code.length >= 6,
                        number: controller.code.length >= 6
                            ? controller.code[5]
                            : '',
                        secure: secure,
                      ),
                    ],
                  ),
                  error: controller.error,
                  align: CrossAxisAlignment.center,
                  textAlign: TextAlign.center,
                ),
              ),
              ContainerX(
                backgroundColor: ColorX.transparent,
                padding: EdgeInsets.only(
                    left: 16.0, top: 16.0, right: 16.0, bottom: 0.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        MbxPinButton(
                          title: '1',
                          clicked: () {
                            controller.btnKeypadClicked('1');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '2',
                          clicked: () {
                            controller.btnKeypadClicked('2');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '3',
                          clicked: () {
                            controller.btnKeypadClicked('3');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxPinButton(
                          title: '4',
                          clicked: () {
                            controller.btnKeypadClicked('4');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '5',
                          clicked: () {
                            controller.btnKeypadClicked('5');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '6',
                          clicked: () {
                            controller.btnKeypadClicked('6');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        MbxPinButton(
                          title: '7',
                          clicked: () {
                            controller.btnKeypadClicked('7');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '8',
                          clicked: () {
                            controller.btnKeypadClicked('8');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '9',
                          clicked: () {
                            controller.btnKeypadClicked('9');
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 4.0),
                    Row(
                      children: [
                        controller.biometricEnabled == true
                            ? MbxPinButton(
                                faIcon: FontAwesomeIcons.fingerprint,
                                clicked: () {
                                  controller.btnBiometricClicked();
                                },
                              )
                            : MbxPinButton(
                                title: '',
                                clicked: () {},
                              ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          title: '0',
                          clicked: () {
                            controller.btnKeypadClicked('0');
                          },
                        ),
                        ContainerX(width: 4.0),
                        MbxPinButton(
                          faIcon: FontAwesomeIcons.deleteLeft,
                          clicked: () {
                            controller.btnBackspaceClicked();
                          },
                        ),
                      ],
                    ),
                    ContainerX(height: 16.0),
                    Visibility(
                        visible: optionTitle.isNotEmpty,
                        child: Column(
                          children: [
                            ButtonX(
                              title: optionTitle,
                              titleColor: ColorX.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w700,
                              backgroundColor: ColorX.transparent,
                              highlightColor: ColorX.theme.withValues(alpha: 0.1),
                              width: 120.0,
                              height: 32.0,
                              cornerRadius: 8.0,
                              clicked: optionClicked,
                            ),
                            ContainerX(height: 16.0)
                          ],
                        ))
                  ],
                ),
              ),
            ])));
  }
}
