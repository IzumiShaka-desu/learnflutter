import 'package:flutter/material.dart';
import 'package:learflutter/components/molecules/chart_section.dart';
import 'package:learflutter/components/molecules/readmore_text.dart';
import 'package:learflutter/constant/color_pallete.dart';
import 'package:learflutter/data/models/chart.dart';
import 'package:learflutter/ui/viewmodels/main_viewmodel.dart';
import 'package:provider/provider.dart';

class StatisticPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<MainViewmodel>(builder: (context, provider, _) {
        List<Chart> charts = provider.charts;
        if (charts == null) {
          provider.loadCharts();
          return Center(child: CircularProgressIndicator());
        }
        print(charts.first.toJson());
        return DefaultTabController(
          length: charts.length,
          child: Column(
            children: [
              Container(
                color: ColorPallete.primary,
                child: TabBar(
                    tabs: charts
                        .map<Tab>((e) => Tab(
                              text: e.name,
                            ))
                        .toList()),
              ),
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: charts.map<Widget>(
                    (e) => Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ReadMoreText(
                              text: e.detail,
                              expandText: " show more",
                              closeText: " show less"),
                          Expanded(child: ChartSection(e)),
                        ],
                      ),
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
