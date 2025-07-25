import 'package:mbxflutter/apis/mbx_device_info_vm.dart';
import 'package:mbxflutter/biller-pln/prepaid/views/mbx_electricity_prepaid_screen.dart';
import 'package:mbxflutter/biller-pulsa/dataplan/views/mbx_pulsa_dataplan_screen.dart';
import 'package:mbxflutter/cardless/views/mbx_cardless_payment_screen.dart';
import 'package:mbxflutter/cardless/views/mbx_cardless_screen.dart';
import 'package:mbxflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbxflutter/login/views/mbx_login_screen.dart';
import 'package:mbxflutter/preferences/language_controller.dart';
import 'package:mbxflutter/preferences/language_selection_screen.dart';
import 'package:mbxflutter/preferences/mbx_preferences_vm.dart';
import 'package:mbxflutter/preferences/mbx_preferences_vm_users.dart';
import 'package:mbxflutter/preferences/translation_service.dart';
import 'package:mbxflutter/privacy-policy/views/mbx_privacy_policy_screen.dart';
import 'package:mbxflutter/qris/views/mbx_qris_screen.dart';
import 'package:mbxflutter/receipt/views/mbx_receipt_screen.dart';
import 'package:mbxflutter/relogin/views/mbx_relogin_screen.dart';
import 'package:mbxflutter/security/mbx_anti_jailbreak_vm.dart';
import 'package:mbxflutter/theme/viewmodels/mbx_theme_vm.dart';
import 'package:mbxflutter/utils/mbx_reachability_vm.dart';

import 'biller-pbb/views/mbx_pbb_screen.dart';
import 'biller-pdam/views/mbx_pdam_screen.dart';
import 'biller-pln/nontaglis/views/mbx_electricity_nontaglis_screen.dart';
import 'biller-pln/postpaid/views/mbx_electricity_postpaid_screen.dart';
import 'biller-pulsa/postpaid/views/mbx_pulsa_postpaid_screen.dart';
import 'biller-pulsa/prepaid/views/mbx_pulsa_prepaid_screen.dart';
import 'bottom-navbar/views/mbx_bottom_navbar_screen.dart';
import 'news/views/mbx_news_screen.dart';
import 'tnc/views/mbx_tnc_screen.dart';
import 'transfer/main/views/mbx_transfer_screen.dart';
import 'transfer/p2bank/views/mbx_transfer_p2bank_screen.dart';
import 'transfer/p2p/views/mbx_transfer_p2p_screen.dart';
import 'widget-x/all_widgets.dart';
import 'widget-x/media_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MbxAntiJailbreakVM.check();
  await MbxDeviceInfoVM.request();
  MbxReachabilityVM.startListening();

  // Initialize language controller with lazy loading
  Get.lazyPut<LanguageController>(() => LanguageController(), fenix: true);

  final freshInstall = await MbxPreferencesVM.getFreshInstall();
  if (freshInstall == true) {
    await MbxPreferencesVM.setFreshInstall(false);
    await MbxUserPreferencesVM.resetAll();
  }

  final theme = await MbxUserPreferencesVM.getTheme();
  if (theme.isNotEmpty) {
    ColorX.theme = hexToColor(await MbxUserPreferencesVM.getTheme());
  } else {
    ColorX.theme = MbxThemeVM.colors[0];
    final hex = '#${ColorX.theme.toARGB32().toRadixString(16).padLeft(8, '0')}';
    MbxUserPreferencesVM.setTheme(hex);
  }
  await MbxProfileVM.load();

  String initialRoute = '/login';
  final token = await MbxUserPreferencesVM.getToken();
  if (token.isNotEmpty) {
    initialRoute = '/relogin';
  }

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    runApp(
      ContainerX(
        gradientColorBegin: ColorX.black,
        gradientColorEnd: ColorX.gray,
        child: Center(
          child: ClipRRect(
            child: SizedBox(
              width: kIsWeb ? MediaX.width : double.infinity,
              child: MyApp(initialRoute),
            ),
          ),
        ),
      ),
    );
  });
  /*
  if (MbxSessionVM.token.isNotEmpty) {
    MbxSessionVM.checkPinAndBiometric();
  } */

  /*
  final inquiryVM = MbxQRISInquiryVM();
  inquiryVM.request(qr_code: '').then((resp) {
    if (resp.status == 200) {
      Get.to(MbxQRISAmountScreen(inquiry: inquiryVM.inqury))?.then((value) {});
    }
  }); */
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Get.find<LanguageController>();

    return GetMaterialApp(
      popGesture: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: languageController.currentLocale,
      translations: TranslationService(),
      fallbackLocale: const Locale('id', ''),
      scrollBehavior: AppScrollBehavior(),
      title: 'MBankingApp',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(surfaceTintColor: Colors.white),
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: ColorX.lightGray,
          selectionHandleColor: ColorX.gray,
        ),
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.standard,
        primarySwatch: Colors.grey,
        fontFamily: 'Roboto',
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: initialRoute,
      getPages: [
        GetPage(
          name: '/login',
          page: () => const MbxLoginScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/relogin',
          page: () => const MbxReloginScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: '/home',
          page: () => const MbxBottomNavBarScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(name: '/tnc', page: () => MbxTncScreen()),
        GetPage(name: '/privacy', page: () => MbxPrivacyPolicyScreen()),
        GetPage(name: '/news', page: () => MbxNewsScreen()),
        GetPage(name: '/receipt', page: () => MbxReceiptScreen()),
        GetPage(name: '/transfer', page: () => const MbxTransferScreen()),
        GetPage(
          name: '/transfer/p2p',
          page: () => const MbxTransferP2PScreen(),
        ),
        GetPage(
          name: '/transfer/p2bank',
          page: () => const MbxTransferP2BankScreen(),
        ),
        GetPage(
          name: '/qris',
          page: () => const MbxQRISScreen(),
          transition: Transition.noTransition,
        ),
        GetPage(name: '/cardless', page: () => const MbxCardlessScreen()),
        GetPage(
          name: '/cardless/payment',
          page: () => MbxCardlessPaymentScreen(),
        ),
        GetPage(
          name: '/electricity/prepaid',
          page: () => const MbxElectricityPrepaidScreen(),
        ),
        GetPage(
          name: '/electricity/postpaid',
          page: () => const MbxElectricityPostpaidScreen(),
        ),
        GetPage(
          name: '/electricity/nontaglis',
          page: () => const MbxElectricityNonTagLisScreen(),
        ),
        GetPage(
          name: '/pulsa/prepaid',
          page: () => const MbxPulsaPrepaidScreen(),
        ),
        GetPage(
          name: '/pulsa/postpaid',
          page: () => const MbxPulsaPostpaidScreen(),
        ),
        GetPage(
          name: '/pulsa/dataplan',
          page: () => const MbxPulsaDataPlanScreen(),
        ),
        GetPage(name: '/pbb', page: () => const MbxPBBScreen()),
        GetPage(name: '/pdam', page: () => const MbxPDAMScreen()),
        GetPage(name: '/language', page: () => const LanguageSelectionScreen()),
      ],
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    PointerDeviceKind.trackpad,
  };
}
