import 'package:flutter/material.dart';
import 'package:learflutter/data/models/chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class BarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  BarChart( this.seriesList, {this.animate});
  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: charts.BarChart(
      
        seriesList,
        animate: animate??true,
        barRendererDecorator: new charts.BarLabelDecorator<String>(),
        domainAxis: new charts.OrdinalAxisSpec(),
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
          labelAccessorFn: (Datum datas, _) => '${datas.popularity.toString()}k')
    ];
  }
}
