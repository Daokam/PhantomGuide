import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:phantomguide/classes/stat.dart';
import 'package:phantomguide/components/persona-page/stat-chart.dart';

class StatArea extends StatelessWidget {
  List<num> stats;

  StatArea({super.key, required this.stats});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 150,
        color: Colors.white,
        child: Row(children: [
          Expanded(
              flex: 1,
              child: Container(
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        'ST',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'MA',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'EN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'AG',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        'LU',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ))),
          Expanded(
              flex: 1,
              child: Container(
                  height: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (num stat in stats)
                        Text(
                          stat.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        )
                    ],
                  ))),
          Expanded(
              flex: 9,
              child: Container(
                  width: 100,
                  child: StatChart(
                    stats: stats,
                  )))
        ]));
  }
}
