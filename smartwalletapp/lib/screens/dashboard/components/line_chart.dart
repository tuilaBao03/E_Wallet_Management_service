import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


import '../../../repository/DashboardRepository.dart';

class LineChartSample extends StatelessWidget {
  final List<Card_Time> cardTimes;
  final String xAxisTitle;
  final String yAxisTitle;

  const LineChartSample({
    super.key,
    required this.cardTimes,
    required this.xAxisTitle,
    required this.yAxisTitle,
  });

  @override
  Widget build(BuildContext context) {
    if (cardTimes.isEmpty) {
      return Center(
        child: Text(
          "No data available",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      );
    }

    // Convert Card_Time -> FlSpot
    List<FlSpot> spots = cardTimes.asMap().entries.map((entry) {
      int index = entry.key;
      return FlSpot(index.toDouble(), entry.value.count.toDouble());
    }).toList();

    // Xác định maxX và maxY
    double maxX = (cardTimes.length - 1).toDouble();
    double maxY = cardTimes.map((e) => e.count).reduce((a, b) => a > b ? a : b).toDouble();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'Card Creation Trends',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onPrimary),
          ),
          const SizedBox(height: 10),
          Container(
            color: Colors.transparent,
            height: 300,
            width: double.infinity,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 1,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < cardTimes.length) {
                          return Text(
                            cardTimes[index].time,
                            style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.onPrimary),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: true),
                minX: 0,
                maxX: maxX,
                minY: 0,
                maxY: maxY,
                lineBarsData: [
                  LineChartBarData(
                    spots: spots,
                    isCurved: true,
                    barWidth: 2,
                    color: Colors.blue,
                    dotData: FlDotData(show: true),
                  ),
                ],
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    tooltipPadding: const EdgeInsets.all(8),
                    tooltipMargin: 8,
                    tooltipRoundedRadius: 8,
                    getTooltipItems: (touchedSpots) {
                      return touchedSpots.map((spot) {
                        int index = spot.x.toInt();
                        return LineTooltipItem(
                          '${cardTimes[index].time}\n${spot.y.toInt()} cards',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
