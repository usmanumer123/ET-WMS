import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/view/AssetsDestails/bottomBar.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class Despreciation extends StatelessWidget {
  List<ChartData> chartData = [
    ChartData(2020, 2000),
    ChartData(2021, 6000),
    ChartData(2022, 4000),
    ChartData(2023, 1000),
    ChartData(2024, 5000),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // height: 300,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow:const [
                  BoxShadow(
                    color: Color.fromARGB(132, 158, 158, 158),
                    spreadRadius: 3.0,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 4.0),
                  ),
                ],
              ),
              child: Column(
                children: [
                  des(
                    'Date Acquired',
                    '05/07/2013',
                  ),
                  des(
                    'Total Cost(USD)',
                    '\$2500.00',
                  ),
                  des(
                    'Salvage value (USD)',
                    '\$25000.00',
                  ),
                  des(
                    'Asset Life (months)',
                    '60 months',
                  ),
                  des(
                    'Despreciation Method',
                    'Sum of the years',
                  ),
                ],
              ),
            ).marginOnly(top: 20),
            Row(
              children: const [
                Icon(
                  Icons.show_chart_rounded,
                  size: 35,
                  color: UIDataColors.commonColor,
                ),
                Text(
                  'Despreciation Monthly Status',
                  style: TextStyle(
                      color: UIDataColors.commonColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ).marginSymmetric(vertical: 20),
                SfCartesianChart(
              
                  series:[
                    SplineSeries<ChartData, double>(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                      markerSettings: MarkerSettings(isVisible: true),
                      color: Colors.blue,
                    )
                  ],
                  // primaryXAxis: NumericAxis(
                  //   title: AxisTitle(text: 'X-Axis'), // Set X-axis title
                  //   edgeLabelPlacement: EdgeLabelPlacement
                  //       .hide, // Hide the last label on X-axis
                  // ),
                  // primaryYAxis: NumericAxis(
                  //   title: AxisTitle(text: 'Y-Axis'), // Set Y-axis title
                  // ),
                ),
          ],
        ).marginSymmetric(horizontal: 15),
      ),
      bottomNavigationBar: bottombar(4),
    );
  }

  Container des(String key, String value) {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          SizedBox(
              width: Get.width / 2.5,
              child: Text(
                '$key:',
                style: TextStyle(fontWeight: FontWeight.w600),
              )).marginOnly(left: 20),
          Text('$value').marginOnly(left: 20)
        ],
      ),
    );
  }

  PreferredSize appbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1.0,
              blurRadius: 3.0,
              offset: Offset(0.0, 2.0),
            ),
          ],
        ),
        child: AppBar(
          title: Text(
            'DESPRECIATION',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  final double x;
  final double y;

  ChartData(this.x, this.y);
}
