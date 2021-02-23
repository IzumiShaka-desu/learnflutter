import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:learflutter/data/models/chart.dart';

class PieChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  PieChart(this.seriesList, {this.animate});
  @override
  Widget build(BuildContext context) {
    return charts.PieChart(
      seriesList,
      animate: animate,
      defaultRenderer: charts.ArcRendererConfig(
        arcRendererDecorators: [
          charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.auto)
        ],
      ),
    );
  }

  ///  Create series data method.

  static List<charts.Series<Datum, String>> createDataSeries(List<Datum> data) {
    return [
      new charts.Series<Datum, String>(
          id: 'popularity',
          domainFn: (Datum datas, _) => datas.name,
          measureFn: (Datum datas, _) => datas.popularity,
          data: data,
          labelAccessorFn: (Datum datas, _) =>
              '${datas.popularity.toString()}k')
    ];
  }
}
