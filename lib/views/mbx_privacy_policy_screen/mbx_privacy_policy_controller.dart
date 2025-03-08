import '../../viewmodels/mbx_privacy_policy_vm.dart';
import '../../widgets/all_widgets.dart';

class MbxPrivacyPolicyController extends GetxController {
  final privacyPolicyVM = MbxPrivacyPolicyVM();
  WebViewController? webController;
  var html = '';

  @override
  void onReady() {
    super.onReady();
    update();
    privacyPolicyVM.request().then((resp) {
      update();
      buildHtmlAndFonts('''
          <span style="font-family: 'Roboto'; font-weight: bold; font-size: 24pt; color: #343a40">${privacyPolicyVM.privacy_policy.title}</span>
          <br><br>
          <span style="font-family: 'Roboto'; font-weight: normal; font-size: 15pt; color: #343a40">${privacyPolicyVM.privacy_policy.content}</span>
        ''').then((value) {
        html = value;
        if (!kIsWeb) {
          webController = WebViewController();
          webController?.loadHtmlString(html);
        }
      });
    });
  }

  btnBackClicked() {
    Get.back();
  }

  static Future<String> buildHtmlAndFonts(String html) async {
    if (html.isNotEmpty) {
      if (kIsWeb) {
        return html;
      } else {
        String htmlPage = '''<html>
              <head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>
              <style>
              ${await addFont(fontFamily: 'Roboto', fontPath: 'assets/fonts/Roboto-Regular.ttf', fontMime: 'font/ttf')}
              </style>              
              </head>
              <body style='margin:16pt;padding:0pt;'>
              ${html}
              </body></html>''';
        return htmlPage;
      }
    } else {
      return '';
    }
  }

  static Future<String> addFont(
      {required String fontFamily,
      required String fontPath,
      required String fontMime}) async {
    final fontData = await rootBundle.load(fontPath);
    final fontUri = getFontUri(fontData, fontMime).toString();
    final fontCss = '''
    @font-face {
      font-family: $fontFamily; 
      src: url($fontUri); 
    }
    ''';
    return fontCss;
  }

  static String getFontUri(ByteData data, String mime) {
    final buffer = data.buffer;
    return Uri.dataFromBytes(
            buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
            mimeType: mime)
        .toString();
  }
}
