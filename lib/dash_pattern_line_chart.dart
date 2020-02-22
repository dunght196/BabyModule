/// Dash pattern line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

/// Example of a line chart rendered with dash patterns.
class DashPatternLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  DashPatternLineChart(this.seriesList, {this.animate});

  /// Creates a [LineChart] with sample data and no transition.
  factory DashPatternLineChart.withSampleData() {
    return new DashPatternLineChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      defaultRenderer:
          charts.LineRendererConfig(includeArea: false, stacked: false),
      animate: animate,
      customSeriesRenderers: [
            charts.PointRendererConfig(
            // ID used to link series to this renderer.
            customRendererId: 'customPoint'),
            charts.LineRendererConfig(customRendererId: 'customLine'),
      ],
      behaviors: [
        charts.SlidingViewport(),
        charts.PanAndZoomBehavior(),
      ],
      domainAxis: new charts.NumericAxisSpec(
          viewport: new charts.NumericExtents(0, 8)),
    );
  }

  /// Create three series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final myFakeDesktopData = [
      new LinearSales(0, 5),
      new LinearSales(1, 25),
      new LinearSales(2, 80),
      new LinearSales(10, 75),
      new LinearSales(25, 90),
    ];

    var myFakeTabletData = [
      new LinearSales(0, 10),
      new LinearSales(1, 50),
      new LinearSales(2, 120),
      new LinearSales(8, 125),
    ];

    var myFakeMobileData = [
      new LinearSales(1, 250),
      new LinearSales(2, 300),
      new LinearSales(3, 225),
    ];

    var myFakeMobileData1 = [
      new LinearSales(1, 250),
      new LinearSales(3, 225),
    ];

    var myFakeMobileData2 = [
      new LinearSales(1, 250),
      new LinearSales(2, 300),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeTabletData,
      ),
      new charts.Series<LinearSales, int>(
          id: 'Weight',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData1)
        ..setAttribute(charts.rendererIdKey, 'customLine'),
      new charts.Series<LinearSales, int>(
          id: 'Increase',
          colorFn: (_, __) => charts.MaterialPalette.gray.shadeDefault,
          dashPatternFn: (_, __) => [2, 2],
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData2)
        ..setAttribute(charts.rendererIdKey, 'customLine'),
      /*   new charts.Series<LinearSales, int>(
        id: 'Mobile',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        dashPatternFn: (_, __) => [8, 3, 2, 3],
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeMobileData,
      )*/
      new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData)
        // Configure our custom point renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customPoint'),
      new charts.Series<LinearSales, int>(
          id: 'Label',
          colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData2,
          labelAccessorFn: (LinearSales sales, _) => sales.sales.toString(),
      )..setAttribute(charts.rendererIdKey, 'customLabel'),
      // Configure our custom point renderer for this series.
    ];
  }
}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}


