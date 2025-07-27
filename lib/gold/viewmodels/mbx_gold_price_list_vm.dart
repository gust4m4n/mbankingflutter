import '../models/mbx_gold_price_model.dart';

class MbxGoldPriceListVM {
  static List<MbxGoldPriceModel> list = [];
  static bool isLoading = false;
  static String error = '';

  static Future<void> loadGoldPrices() async {
    try {
      isLoading = true;
      error = '';

      // Simulate API call with dummy data for the last 30 days
      await Future.delayed(Duration(milliseconds: 500));

      list = _generateDummyGoldPrices();
      isLoading = false;
    } catch (e) {
      error = e.toString();
      isLoading = false;
    }
  }

  static List<MbxGoldPriceModel> _generateDummyGoldPrices() {
    List<MbxGoldPriceModel> prices = [];
    DateTime now = DateTime.now();
    double basePrice = 1050000.0; // Base gold price in IDR per gram

    for (int i = 29; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));

      // Generate realistic price fluctuation
      double fluctuation =
          (i * 0.5 - 15) * 1000 + (i % 7) * 2000 + (i % 3) * 1500;
      double price = basePrice + fluctuation;

      // Calculate change from previous day
      double previousPrice = i == 29
          ? basePrice
          : basePrice +
                ((i + 1) * 0.5 - 15) * 1000 +
                ((i + 1) % 7) * 2000 +
                ((i + 1) % 3) * 1500;

      double change = price - previousPrice;
      double changePercent = (change / previousPrice) * 100;

      prices.add(
        MbxGoldPriceModel(
          date:
              '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}',
          price: price,
          change: change,
          changePercent: changePercent,
        ),
      );
    }

    return prices;
  }

  static double get currentPrice => list.isNotEmpty ? list.last.price : 0.0;
  static double get currentChange => list.isNotEmpty ? list.last.change : 0.0;
  static double get currentChangePercent =>
      list.isNotEmpty ? list.last.changePercent : 0.0;
  static bool get isPositiveChange => currentChange >= 0;
}
