import 'package:fl_chart/fl_chart.dart';
import 'package:mbxflutter/gold/viewmodels/mbx_gold_price_list_vm.dart';
import 'package:mbxflutter/utils/mbx_format_vm.dart';

import '../../widget-x/all_widgets.dart';

class MbxGoldChartWidget extends StatelessWidget {
  const MbxGoldChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (MbxGoldPriceListVM.list.isEmpty) {
      return ContainerX(
        height: 200.0,
        child: Center(
          child: MbxGoldPriceListVM.isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(ColorX.theme),
                )
              : TextX(
                  MbxGoldPriceListVM.error.isEmpty
                      ? 'noDataAvailable'.tr
                      : MbxGoldPriceListVM.error,
                  color: ColorX.gray,
                  fontSize: 14.0,
                ),
        ),
      );
    }

    return ContainerX(
      height: 200.0,
      padding: EdgeInsets.only(left: 8.0, top: 16.0, right: 16.0, bottom: 8.0),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: _calculateInterval(),
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: ColorX.lightGray.withValues(alpha: 0.3),
                strokeWidth: 0.5,
              );
            },
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                interval: 7,
                getTitlesWidget: (double value, TitleMeta meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= MbxGoldPriceListVM.list.length) {
                    return SizedBox.shrink();
                  }

                  final date = DateTime.parse(
                    MbxGoldPriceListVM.list[index].date,
                  );
                  return Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: TextX(
                      '${date.day}/${date.month}',
                      color: ColorX.gray,
                      fontSize: 10.0,
                    ),
                  );
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: _calculateInterval(),
                reservedSize: 60,
                getTitlesWidget: (double value, TitleMeta meta) {
                  return TextX(
                    MbxFormatVM.formatCurrency(value, symbol: 'K'),
                    color: ColorX.gray,
                    fontSize: 10.0,
                    textAlign: TextAlign.right,
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (MbxGoldPriceListVM.list.length - 1).toDouble(),
          minY: _getMinPrice() * 0.995,
          maxY: _getMaxPrice() * 1.005,
          lineBarsData: [
            LineChartBarData(
              spots: _getSpots(),
              isCurved: true,
              gradient: LinearGradient(
                colors: [ColorX.theme, ColorX.theme.withValues(alpha: 0.7)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    ColorX.theme.withValues(alpha: 0.3),
                    ColorX.theme.withValues(alpha: 0.1),
                    ColorX.theme.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ],
          lineTouchData: LineTouchData(
            enabled: true,
            touchTooltipData: LineTouchTooltipData(
              getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                return touchedBarSpots.map((barSpot) {
                  final index = barSpot.x.toInt();
                  if (index < 0 || index >= MbxGoldPriceListVM.list.length) {
                    return null;
                  }

                  final goldPrice = MbxGoldPriceListVM.list[index];
                  final date = DateTime.parse(goldPrice.date);

                  return LineTooltipItem(
                    '${date.day}/${date.month}/${date.year}\n${MbxFormatVM.currencyRP(goldPrice.price.toInt(), prefix: true, mutation: false, masked: false)}',
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  List<FlSpot> _getSpots() {
    return MbxGoldPriceListVM.list.asMap().entries.map((entry) {
      return FlSpot(entry.key.toDouble(), entry.value.price);
    }).toList();
  }

  double _getMinPrice() {
    if (MbxGoldPriceListVM.list.isEmpty) return 0;
    return MbxGoldPriceListVM.list
        .map((e) => e.price)
        .reduce((a, b) => a < b ? a : b);
  }

  double _getMaxPrice() {
    if (MbxGoldPriceListVM.list.isEmpty) return 0;
    return MbxGoldPriceListVM.list
        .map((e) => e.price)
        .reduce((a, b) => a > b ? a : b);
  }

  double _calculateInterval() {
    final min = _getMinPrice();
    final max = _getMaxPrice();
    final range = max - min;
    return range / 4; // Show 4 intervals
  }
}
