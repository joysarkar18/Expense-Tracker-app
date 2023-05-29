import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';

class LinexChart extends StatefulWidget {
  const LinexChart({super.key});

  @override
  State<LinexChart> createState() => _LinexChartState();
}

class _LinexChartState extends State<LinexChart> {
  var data = [100.0, 300.0, 345.0, 123.0, 457.0, 385.0, 367.0];
  @override
  Widget build(BuildContext context) {
    return Sparkline(
      data: data,
      lineColor: const Color.fromARGB(255, 255, 255, 255),
      lineWidth: 4,
      useCubicSmoothing: true,
      cubicSmoothingFactor: 0.09,
      gridLinelabelPrefix: "₹",
      gridLineLabelPrecision: 1,
      enableGridLines: true,
      gridLineColor: Color.fromARGB(255, 0, 255, 0),
      gridLineLabelColor: Color.fromARGB(255, 0, 255, 115),
      gridLineAmount: 3,
      gridLinelabel: (gridLineValue) {
        return gridLineValue.toInt().toString();
      },
      max: 500.0,
      min: 0.0,
    );
  }
}
