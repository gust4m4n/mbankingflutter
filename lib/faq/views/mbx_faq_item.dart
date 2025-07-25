import '../../widget-x/all_widgets.dart';
import '../models/mbx_faq_model.dart';

class MbxFaqItem extends StatelessWidget {
  final MbxFaqModel faq;
  final VoidCallback onTap;

  const MbxFaqItem({super.key, required this.faq, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      backgroundColor: ColorX.white,
      cornerRadius: 12.0,
      borderWidth: 1.0,
      borderColor: ColorX.lightGray,
      margin: EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextX(
                      faq.question,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorX.black,
                      maxLines: 32,
                    ),
                  ),
                  ContainerX(width: 8.0),
                  ImageX(
                    faIcon: faq.isExpanded
                        ? FontAwesomeIcons.chevronUp
                        : FontAwesomeIcons.chevronDown,
                    color: ColorX.theme,
                    width: 16.0,
                    height: 16.0,
                  ),
                ],
              ),
              if (faq.isExpanded) ...[
                ContainerX(height: 12.0),
                ContainerX(height: 1.0, backgroundColor: ColorX.lightGray),
                ContainerX(height: 12.0),
                TextX(
                  faq.answer,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: ColorX.black,
                  textAlign: TextAlign.justify,
                  maxLines: 2048,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
