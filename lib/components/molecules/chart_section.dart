import 'package:flutter/material.dart';
import 'package:learflutter/components/atoms/bar_chart.dart';
import 'package:learflutter/components/atoms/pie_chart.dart';
import 'package:learflutter/components/atoms/text_subtitle_widget.dart';
import 'package:learflutter/constant/chart_type.dart';
import 'package:learflutter/data/models/chart.dart';

class ChartSection extends StatefulWidget {
  final Chart chart;
  const ChartSection(
    this.chart, {
    Key key,
  }) : super(key: key);

  @override
  _ChartSectionState createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
  ChartType _chartType = ChartType.pie;
  bool get isBarChart => _chartType == ChartType.bar;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextSubtitleWidget(text: 'Chart type : '),
              DropdownButton<ChartType>(
                  onChanged: (value) {
                    setState(() {
                      _chartType = value;
                    });
                  },
                  items: [
                    DropdownMenuItem<ChartType>(
                      child: Text('bar'),
                      value: ChartType.bar,
                    ),
                    DropdownMenuItem<ChartType>(
                      child: Text('pie'),
                      value: ChartType.pie,
                    ),
                  ]),
            ],
          ),
          Expanded(
            child: isBarChart
                ? Container(
                  child: BarChart(
                      BarChart.createDataSeries(
                        widget.chart.data,
                      ),
                    ),
                )
                : Container(
                  child: PieChart(
                      PieChart.createDataSeries(
                        widget.chart.data,
                      ),
                    ),
                ),
          )
        ],
      ),
    );
  }
}
