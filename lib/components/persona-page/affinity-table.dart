import 'package:flutter/material.dart';
import 'package:phantomguide/services/element-service.dart';

class AffinityTable extends StatelessWidget {
  List<String> affinities;
  AffinityTable({super.key, required this.affinities});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 3, color: Colors.white))),
        child: DataTable(
            headingRowHeight: 40,
            headingRowColor: MaterialStateProperty.all(Colors.white),
            dataRowColor: MaterialStateProperty.all(Colors.black),
            dataTextStyle: TextStyle(color: Colors.white),
            columnSpacing: 4,
            columns: <DataColumn>[
              for (var element in ElementService().getElements())
                DataColumn(
                    label: Container(
                        color: Colors.black,
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'assets/icons/P5R/elements/$element.webp',
                          width: 30,
                          height: 30,
                        ))),
            ],
            rows: <DataRow>[
              DataRow(cells: <DataCell>[
                for (var affinity in affinities)
                  DataCell(Center(
                      child: Text(affinity, style: TextStyle(fontSize: 20)))),
              ])
            ]));
  }
}
