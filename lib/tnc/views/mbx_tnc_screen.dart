import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../widgets/all_widgets.dart';
import 'mbx_tnc_controller.dart';

class MbxTncScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxTncController>(
      init: MbxTncController(),
      builder: (controller) => MbxScreen(
          curvedBody: ContainerX(
        backgroundColor: ColorX.white,
        child: controller.tncVM.loading
            ? Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(ColorX.gray)),
              )
            : kIsWeb
                ? SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: HtmlWidget(controller.html)))
                : controller.webController != null
                    ? WebViewWidget(controller: controller.webController!)
                    : ContainerX(),
      )),
    );
  }
}
