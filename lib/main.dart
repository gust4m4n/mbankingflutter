import 'package:mbankingflutter/biller-pulsa/dataplan/views/mbx_pulsa_dataplan_screen.dart';
import 'package:mbankingflutter/cardless/views/mbx_cardless_payment_screen.dart';
import 'package:mbankingflutter/cardless/views/mbx_cardless_screen.dart';
import 'package:mbankingflutter/login/viewmodels/mbx_profile_vm.dart';
import 'package:mbankingflutter/login/views/mbx_login_screen.dart';
import 'package:mbankingflutter/biller-pln/prepaid/views/mbx_electricity_prepaid_screen.dart';
import 'package:mbankingflutter/privacy-policy/views/mbx_privacy_policy_screen.dart';
import 'package:mbankingflutter/qris/views/mbx_qris_screen.dart';
import 'package:mbankingflutter/receipt/views/mbx_receipt_screen.dart';
import 'package:mbankingflutter/relogin/views/mbx_relogin_screen.dart';
import 'package:mbankingflutter/theme/viewmodels/mbx_theme_vm.dart';
import 'package:mbankingflutter/utils/mbx_anti_jailbreak_vm.dart';
import 'package:mbankingflutter/utils/mbx_device_info_vm.dart';
import 'package:mbankingflutter/utils/mbx_preferences_vm+users.dart';
import 'package:mbankingflutter/utils/mbx_preferences_vm.dart';
import 'package:mbankingflutter/utils/mbx_reachability_vm.dart';

import 'bottom-navbar/views/mbx_bottom_navbar_screen.dart';
import 'news/views/mbx_news_screen.dart';
import 'biller-pbb/views/mbx_pbb_screen.dart';
import 'biller-pdam/views/mbx_pdam_screen.dart';
import 'biller-pln/nontaglis/views/mbx_electricity_nontaglis_screen.dart';
import 'biller-pln/postpaid/views/mbx_electricity_postpaid_screen.dart';
import 'biller-pulsa/postpaid/views/mbx_pulsa_postpaid_screen.dart';
import 'biller-pulsa/prepaid/views/mbx_pulsa_prepaid_screen.dart';
import 'tnc/views/mbx_tnc_screen.dart';
import 'transfer-p2bank/views/mbx_transfer_p2bank_screen.dart';
import 'transfer-p2p/views/mbx_transfer_p2p_screen.dart';
import 'transfer/views/mbx_transfer_screen.dart';
import 'widgets/all_widgets.dart';
import 'widgets/media_x.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MbxAntiJailbreakVM.check();
  await MbxDeviceInfoVM.request();
  MbxReachabilityVM.startListening();

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
    final hex = '#${ColorX.theme.value.toRadixString(16)}';
    MbxUserPreferencesVM.setTheme(hex);
  }
  await MbxProfileVM.load();

  String initialRoute = '/login';
  final token = await MbxUserPreferencesVM.getToken();
  if (token.isNotEmpty) {
    initialRoute = '/relogin';
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      ContainerX(
        gradientColorBegin: ColorX.black,
        gradientColorEnd: ColorX.gray,
        child: Center(
          child: ClipRRect(
              child: Container(
            width: kIsWeb ? MediaX.width : double.infinity,
            child: MyApp(initialRoute),
          )),
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
  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      scrollBehavior: AppScrollBehavior(),
      title: 'MBankingFlutter',
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(surfaceTintColor: Colors.white),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorX.lightGray,
            selectionHandleColor: ColorX.gray,
          ),
          splashColor: Colors.transparent,
          visualDensity: VisualDensity.standard,
          primarySwatch: Colors.grey,
          fontFamily: 'Roboto',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
      initialRoute: initialRoute,
      getPages: [
        GetPage(
            name: '/login',
            page: () => MbxLoginScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: '/relogin',
            page: () => MbxReloginScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: '/home',
            page: () => MbxBottomNavBarScreen(),
            transition: Transition.noTransition),
        GetPage(name: '/tnc', page: () => MbxTncScreen()),
        GetPage(name: '/privacy', page: () => MbxPrivacyPolicyScreen()),
        GetPage(name: '/news', page: () => MbxNewsScreen()),
        GetPage(name: '/receipt', page: () => MbxReceiptScreen()),
        GetPage(name: '/transfer', page: () => MbxTransferScreen()),
        GetPage(name: '/transfer/p2p', page: () => MbxTransferP2PScreen()),
        GetPage(
            name: '/transfer/p2bank', page: () => MbxTransferP2BankScreen()),
        GetPage(
            name: '/qris',
            page: () => MbxQRISScreen(),
            transition: Transition.noTransition),
        GetPage(name: '/cardless', page: () => MbxCardlessScreen()),
        GetPage(
            name: '/cardless/payment', page: () => MbxCardlessPaymentScreen()),
        GetPage(
            name: '/electricity/prepaid',
            page: () => MbxElectricityPrepaidScreen()),
        GetPage(
            name: '/electricity/postpaid',
            page: () => MbxElectricityPostpaidScreen()),
        GetPage(
            name: '/electricity/nontaglis',
            page: () => MbxElectricityNonTagLisScreen()),
        GetPage(name: '/pulsa/prepaid', page: () => MbxPulsaPrepaidScreen()),
        GetPage(name: '/pulsa/postpaid', page: () => MbxPulsaPostpaidScreen()),
        GetPage(name: '/pulsa/dataplan', page: () => MbxPulsaDataPlanScreen()),
        GetPage(name: '/pbb', page: () => MbxPBBScreen()),
        GetPage(name: '/pdam', page: () => MbxPDAMScreen()),
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
