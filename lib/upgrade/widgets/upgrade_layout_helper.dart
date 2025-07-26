import '../../widget-x/all_widgets.dart';

class UpgradeLayoutHelper {
  // Standard progress indicator untuk semua upgrade screens
  static Widget buildProgressIndicator(int currentStep, int totalSteps) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: List.generate(totalSteps * 2 - 1, (index) {
          if (index.isEven) {
            // This is a step indicator
            int stepIndex = index ~/ 2;
            return Expanded(
              child: ContainerX(
                height: 4.0,
                backgroundColor: stepIndex < currentStep
                    ? ColorX.theme
                    : ColorX.lightGray,
                cornerRadius: 2.0,
              ),
            );
          } else {
            // This is a spacer
            return ContainerX(width: 8.0);
          }
        }),
      ),
    );
  }

  // Standard step indicator text
  static Widget buildStepIndicator(String stepText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextX(
        stepText,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: ColorX.gray,
      ),
    );
  }

  // Standard screen header
  static Widget buildHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextX(
        title,
        fontSize: 24.0,
        fontWeight: FontWeight.w700,
        color: ColorX.black,
      ),
    );
  }

  // Standard description text
  static Widget buildDescription(String description) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: TextX(
        description,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: ColorX.gray,
        maxLines: 10,
      ),
    );
  }

  // Standard spacing
  static Widget get standardSpacing => ContainerX(height: 24.0);
  static Widget get smallSpacing => ContainerX(height: 8.0);
  static Widget get mediumSpacing => ContainerX(height: 16.0);
  static Widget get largeSpacing => ContainerX(height: 32.0);

  // Standard container untuk konten utama
  static Widget buildContentContainer({
    required Widget child,
    EdgeInsets? padding,
  }) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.0),
      child: child,
    );
  }

  // Standard button dengan consistent styling
  static Widget buildContinueButton({
    required String title,
    required VoidCallback onPressed,
    bool isLoading = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ButtonX(
        title: title,
        backgroundColor: ColorX.theme,
        titleColor: ColorX.white,
        cornerRadius: 12.0,
        height: 52.0,
        clicked: isLoading ? null : onPressed,
      ),
    );
  }

  // Standard photo preview container untuk semua photo screens
  static Widget buildPhotoPreview({
    required Widget? photoWidget,
    String? placeholderText,
    String? placeholderSubtext,
    IconData? placeholderIcon,
    double height = 400.0,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ContainerX(
        width: double.infinity,
        height: height,
        backgroundColor: ColorX.lightGray.withValues(alpha: 0.3),
        cornerRadius: 16.0,
        borderColor: photoWidget != null
            ? ColorX.green.withValues(alpha: 0.8)
            : ColorX.theme.withValues(alpha: 0.3),
        borderWidth: 2.0,
        child: photoWidget != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: photoWidget,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageX(
                    faIcon: placeholderIcon ?? FontAwesomeIcons.camera,
                    color: ColorX.gray,
                    width: 64.0,
                    height: 64.0,
                  ),
                  ContainerX(height: 16.0),
                  TextX(
                    placeholderText ?? 'upgrade_no_photo'.tr,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: ColorX.gray,
                  ),
                  if (placeholderSubtext != null) ...[
                    ContainerX(height: 8.0),
                    TextX(
                      placeholderSubtext,
                      fontSize: 14.0,
                      color: ColorX.gray,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
      ),
    );
  }
}
