import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:mbxflutter/news/models/mbx_news_model.dart';
import 'package:mbxflutter/widget-x/media_x.dart';

import '../../widget-x/all_widgets.dart';
import 'mbx_news_controller.dart';

class MbxNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxNewsController>(
      init: MbxNewsController(),
      builder: (controller) => ScreenX(
        lightStatusBar: true,
        bottomPadding: false,
        bodyView: ContainerX(
          backgroundColor: ColorX.white,
          child: Stack(
            children: [
              ImageX(
                url: controller.news.image,
                width: MediaX.width,
                height: MediaX.width * MbxNewsModel.imageAspectRatio,
              ),
              Positioned(
                left: MediaQuery.of(Get.context!).padding.left + 12.0,
                top: MediaQuery.of(Get.context!).padding.top + 12.0,
                child: ButtonX(
                  title: '',
                  backgroundColor: ColorX.black.withValues(alpha: 0.4),
                  width: 40.0,
                  height: 40.0,
                  cornerRadius: 20.0,
                  faIcon: FontAwesomeIcons.arrowLeft,
                  iconWidth: 18.0,
                  iconHeight: 18.0,
                  faColor: ColorX.white,
                  clicked: () {
                    controller.btnBackClicked();
                  },
                ),
              ),
              Positioned(
                left: 0.0,
                top: (MediaX.width * MbxNewsModel.imageAspectRatio) - 16.0,
                right: 0.0,
                bottom: 0.0,
                child: ContainerX(
                  padding: EdgeInsets.only(top: 16.0),
                  backgroundColor: ColorX.white,
                  topLeftRadius: 16.0,
                  topRightRadius: 16.0,
                  child: kIsWeb
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
            ],
          ),
        ),
      ),
    );
  }
}
