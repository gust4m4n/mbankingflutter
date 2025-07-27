import 'all_widgets.dart';

class TextFieldX extends StatelessWidget {
  final String hint;
  final bool obscureText;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final Color backgroundColor;
  final double cornerRadius;
  final double borderWidth;
  final Color borderColor;
  final double height;
  final TextInputType keyboardType;
  final bool multiline;
  final bool readOnly;
  final ImageX? leftIcon;
  final Color? leftIconColor;
  final GestureTapCallback? leftAction;
  final ImageX? rightIcon;
  final Color? rightIconColor;
  final GestureTapCallback? rightAction;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String value)? onChanged;
  final List<TextInputFormatter>? inputFormatters;

  TextFieldX({
    super.key,
    required this.hint,
    required this.obscureText,
    this.fontSize = 17.0,
    this.fontFamily = 'Roboto',
    this.fontWeight = FontWeight.w400,
    Color? backgroundColor,
    this.cornerRadius = 8.0,
    this.borderWidth = 1.0,
    Color? borderColor,
    this.height = 48.0,
    required this.keyboardType,
    this.multiline = false,
    required this.readOnly,
    this.leftIcon,
    this.leftIconColor,
    this.leftAction,
    this.rightIcon,
    this.rightIconColor,
    this.rightAction,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.inputFormatters,
  }) : backgroundColor = backgroundColor ?? ColorX.white,
       borderColor = borderColor ?? ColorX.lightGray;

  PopupMenuItem popupItemView({
    required String title,
    required Color color,
    required String value,
  }) {
    return PopupMenuItem(
      value: value,
      child: TextX(
        title,
        color: color,
        fontSize: 17.0,
        fontWeight: FontWeight.w500,
        textAlign: TextAlign.left,
        maxLines: 1,
      ),
    );
  }

  Widget leftContainerButton(BuildContext context) {
    return ContainerX(
      width: height - (borderWidth * 1),
      height: height - (borderWidth * 2),
      child: Material(
        color: ColorX.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(cornerRadius - (borderWidth * 2)),
            bottomLeft: Radius.circular(cornerRadius - (borderWidth * 2)),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: ColorX.transparent),
          child: InkWellX(
            clicked: () => leftAction != null ? leftAction!() : null,
            child: leftIcon,
          ),
        ),
      ),
    );
  }

  Widget rightContainerButton(BuildContext context) {
    return ContainerX(
      width: height - (borderWidth * 1),
      height: height - (borderWidth * 2),
      child: Material(
        color: ColorX.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(cornerRadius - (borderWidth * 2)),
            bottomRight: Radius.circular(cornerRadius - (borderWidth * 2)),
          ),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(splashColor: ColorX.transparent),
          child: InkWellX(
            clicked: () => rightAction != null ? rightAction!() : null,
            child: rightIcon,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: (rightIcon != null || leftIcon != null)
          ? ColorX.white
          : readOnly == true
          ? ColorX.gray
          : backgroundColor,
      height: height,
      padding: EdgeInsets.only(
        left: borderWidth > 0.0 ? ((leftIcon != null) ? 0.0 : 12.0) : 0.0,
        top: 0.0,
        right: borderWidth > 0.0 ? ((rightIcon != null) ? 0.0 : 12.0) : 0.0,
        bottom: 0.0,
      ),
      borderWidth: borderWidth,
      borderColor: borderColor,
      cornerRadius: cornerRadius,
      child: Row(
        children: [
          Visibility(
            visible: (leftIcon != null) ? true : false,
            child: leftContainerButton(context),
          ),
          Visibility(
            visible: (leftIcon != null) ? true : false,
            child: const SizedBox(width: 4.0),
          ),
          Expanded(
            child: TextField(
              inputFormatters: inputFormatters,
              textAlignVertical: TextAlignVertical.center,
              enabled: !readOnly,
              controller: controller,
              onChanged: onChanged,
              focusNode: focusNode,
              obscureText: obscureText,
              style: TextStyle(
                height: 1.2,
                color: ColorX.black,
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: fontFamily,
                decoration: TextDecoration.none,
              ),
              keyboardType: multiline ? TextInputType.multiline : keyboardType,
              textInputAction: multiline
                  ? TextInputAction.newline
                  : TextInputAction.done,
              maxLines: obscureText
                  ? 1
                  : multiline
                  ? 8
                  : 1,
              readOnly: readOnly,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                hintText: hint,
                hintStyle: TextStyle(
                  color: ColorX.lightGray,
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  fontFamily: fontFamily,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Visibility(
            visible: (rightIcon != null) ? true : false,
            child: const SizedBox(width: 4.0),
          ),
          Visibility(
            visible: (rightIcon != null) ? true : false,
            child: rightContainerButton(context),
          ),
        ],
      ),
    );
  }
}
