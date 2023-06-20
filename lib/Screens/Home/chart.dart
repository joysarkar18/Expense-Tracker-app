import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:expense_app/Controller/ChartController/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinexChart extends StatefulWidget {
  const LinexChart({super.key});

  @override
  State<LinexChart> createState() => _LinexChartState();
}

class _LinexChartState extends State<LinexChart> {
  ChartController chartController = Get.put(ChartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Sparkline(
          data: chartController.data,
          lineColor: chartController.rebuildHome.value
              ? const Color.fromARGB(255, 255, 255, 255)
              : Colors.white,
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
          max: 100500.0,
          min: 0.0,
        ));
  }
}
