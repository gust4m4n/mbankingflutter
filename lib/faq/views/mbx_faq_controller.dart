import '../../widget-x/all_widgets.dart';
import '../models/mbx_faq_model.dart';

class MbxFaqController extends GetxController {
  List<MbxFaqModel> faqList = [];
  List<MbxFaqModel> filteredFaqList = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadFaqData();
    filteredFaqList = List.from(faqList);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void loadFaqData() {
    if (Get.locale?.languageCode == 'en') {
      loadEnglishFaq();
    } else {
      loadIndonesianFaq();
    }
  }

  void loadIndonesianFaq() {
    faqList = [
      MbxFaqModel(
        question: 'Bagaimana cara mendaftar mobile banking?',
        answer:
            'Untuk mendaftar mobile banking, Anda dapat mengunjungi cabang bank terdekat dengan membawa KTP dan buku tabungan. Atau Anda juga dapat mendaftar melalui ATM dengan memilih menu daftar mobile banking.',
      ),
      MbxFaqModel(
        question: 'Lupa PIN mobile banking, bagaimana cara mengatasinya?',
        answer:
            'Jika Anda lupa PIN mobile banking, silakan hubungi customer service di 14000 atau kunjungi cabang bank terdekat untuk reset PIN.',
      ),
      MbxFaqModel(
        question: 'Bagaimana cara transfer ke bank lain?',
        answer:
            'Pilih menu Transfer > Transfer ke Bank Lain, masukkan nomor rekening tujuan, nama bank, jumlah transfer, dan berita transfer. Kemudian konfirmasi dengan PIN Anda.',
      ),
      MbxFaqModel(
        question: 'Apakah ada biaya untuk transfer antar bank?',
        answer:
            'Ya, terdapat biaya administrasi untuk transfer antar bank. Biaya bervariasi tergantung nominal transfer dan bank tujuan. Anda dapat melihat detail biaya sebelum konfirmasi transaksi.',
      ),
      MbxFaqModel(
        question: 'Bagaimana cara mengaktifkan fitur biometrik?',
        answer:
            'Masuk ke menu Profil > Aktivasi Biometrik, kemudian aktifkan toggle dan masukkan PIN untuk konfirmasi. Pastikan perangkat Anda mendukung fitur biometrik.',
      ),
    ];
  }

  void loadEnglishFaq() {
    faqList = [
      MbxFaqModel(
        question: 'How to register for mobile banking?',
        answer:
            'To register for mobile banking, you can visit the nearest bank branch with your ID card and savings book. Or you can also register via ATM by selecting the mobile banking registration menu.',
      ),
      MbxFaqModel(
        question: 'Forgot mobile banking PIN, how to resolve it?',
        answer:
            'If you forget your mobile banking PIN, please contact customer service at 14000 or visit the nearest bank branch for PIN reset.',
      ),
      MbxFaqModel(
        question: 'How to transfer to other banks?',
        answer:
            'Select Transfer > Transfer to Other Bank menu, enter the destination account number, bank name, transfer amount, and transfer message. Then confirm with your PIN.',
      ),
      MbxFaqModel(
        question: 'Are there fees for interbank transfers?',
        answer:
            'Yes, there are administrative fees for interbank transfers. Fees vary depending on the transfer amount and destination bank. You can see the fee details before confirming the transaction.',
      ),
      MbxFaqModel(
        question: 'How to activate biometric features?',
        answer:
            'Go to Profile > Biometric Activation menu, then activate the toggle and enter your PIN for confirmation. Make sure your device supports biometric features.',
      ),
    ];
  }

  void searchFaq(String query) {
    if (query.isEmpty) {
      filteredFaqList = List.from(faqList);
    } else {
      filteredFaqList = faqList
          .where(
            (faq) =>
                faq.question.toLowerCase().contains(query.toLowerCase()) ||
                faq.answer.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
    update();
  }

  void toggleExpanded(int index) {
    filteredFaqList[index].isExpanded = !filteredFaqList[index].isExpanded;
    update();
  }
}
