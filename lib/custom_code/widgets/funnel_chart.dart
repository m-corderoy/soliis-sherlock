// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import necessary Syncfusion package for funnel chart
import 'package:syncfusion_flutter_charts/charts.dart';

class FunnelChart extends StatefulWidget {
  const FunnelChart({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<FunnelChart> createState() => _FunnelChartState();
}

class _FunnelChartState extends State<FunnelChart> {
  // Define tooltip behavior for the chart
  late TooltipBehavior _tooltip;

  // Define chart data as a member variable
  final List<ChartData> chartData = [
    ChartData('Apr', 25),
    ChartData('May', 38),
    ChartData('Jun', 34),
    ChartData('Jul', 52),
  ];

  @override
  void initState() {
    super.initState();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: SfFunnelChart(
        tooltipBehavior: _tooltip,
        legend: Legend(
            isVisible: true,
            position: LegendPosition.bottom,
            overflowMode: LegendItemOverflowMode.wrap),
        series: FunnelSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
