import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_privacy_policy_controller.dart';

class MbxPrivacyPolicyScreen extends StatelessWidget {
  const MbxPrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxPrivacyPolicyController>(
      init: MbxPrivacyPolicyController(),
      builder: (controller) => MbxScreen(
        curvedBody: ContainerX(
          backgroundColor: ColorX.white,
          child: controller.privacyPolicyVM.loading
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorX.gray),
                  ),
                )
              : kIsWeb
              ? SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: HtmlWidget(controller.html),
                  ),
                )
              : controller.webController != null
              ? WebViewWidget(controller: controller.webController!)
              : ContainerX(),
        ),
      ),
    );
  }
}
