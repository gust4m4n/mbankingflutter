class MbxGoldPriceModel {
  final String date;
  final double price;
  final double change;
  final double changePercent;

  MbxGoldPriceModel({
    required this.date,
    required this.price,
    required this.change,
    required this.changePercent,
  });

  factory MbxGoldPriceModel.fromJson(Map<String, dynamic> json) {
    return MbxGoldPriceModel(
      date: json['date'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      change: (json['change'] ?? 0).toDouble(),
      changePercent: (json['changePercent'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'price': price,
      'change': change,
      'changePercent': changePercent,
    };
  }
}
