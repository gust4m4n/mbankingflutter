import '../../widget-x/all_widgets.dart';

// ignore: must_be_immutable
class MbxLanguageWidget extends StatelessWidget {
  final String flag;
  final String name;
  final String? subtitle;
  final bool isSelected;
  final GestureTapCallback? clicked;

  const MbxLanguageWidget({
    super.key,
    required this.flag,
    required this.name,
    this.subtitle,
    required this.isSelected,
    this.clicked,
  });

  @override
  Widget build(BuildContext context) {
    return InkWellX(
      highlightColor: clicked != null
          ? ColorX.theme.withValues(alpha: 0.1)
          : ColorX.transparent,
      cornerRadius: clicked != null ? 12.0 : 0.0,
      clicked: clicked,
      child: ContainerX(
        backgroundColor: isSelected
            ? ColorX.theme.withValues(alpha: 0.1)
            : ColorX.transparent,
        borderWidth: isSelected ? 2.0 : 1.0,
        borderColor: isSelected ? ColorX.theme : ColorX.lightGray,
        cornerRadius: 12.0,
        padding: EdgeInsets.only(
          left: 16.0,
          top: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        child: Row(
          children: [
            TextX(flag, fontSize: 24.0),
            SizedBox(width: 16.0),
            Expanded(
              child: subtitle != null
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextX(
                          name,
                          color: ColorX.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(height: 2.0),
                        TextX(
                          subtitle!,
                          color: ColorX.gray,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    )
                  : TextX(
                      name,
                      color: ColorX.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
            ),
            if (isSelected)
              ImageX(
                faIcon: FontAwesomeIcons.check,
                color: ColorX.theme,
                width: 20.0,
                height: 20.0,
              ),
          ],
        ),
      ),
    );
  }
}
