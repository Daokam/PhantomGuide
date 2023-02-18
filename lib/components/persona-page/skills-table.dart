import 'package:flutter/material.dart';
import 'package:phantomguide/classes/skill.dart';

class SkillsTable extends StatelessWidget {
  List<Skill> skills;
  SkillsTable({super.key, required this.skills});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        color: Colors.black,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 5,
                    child: DataTable(
                        headingRowHeight: 40,
                        dataTextStyle: TextStyle(color: Colors.white),
                        columnSpacing: 4,
                        columns: const <DataColumn>[
                          DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                            'Level',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          )))),
                          DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                            'Skill',
                            style: TextStyle(color: Colors.white),
                          )))),
                        ],
                        rows: <DataRow>[
                          for (int i = 0; i < skills.length / 2; i++)
                            DataRow(cells: <DataCell>[
                              DataCell(Center(
                                  child: Text(skills[i].level.toString()))),
                              DataCell(Center(child: Text(skills[i].name)))
                            ])
                        ])),
                Expanded(
                    flex: 5,
                    child: DataTable(
                        headingRowHeight: 40,
                        dataTextStyle: TextStyle(color: Colors.white),
                        columnSpacing: 4,
                        columns: const <DataColumn>[
                          DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                            'Level',
                            style: TextStyle(color: Colors.white),
                          )))),
                          DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                            'Skill',
                            style: TextStyle(color: Colors.white),
                          )))),
                        ],
                        rows: <DataRow>[
                          for (int i = skills.length ~/ 2 + 1;
                              i < skills.length;
                              i++)
                            DataRow(cells: <DataCell>[
                              DataCell(Center(
                                  child: Text(skills[i].level.toString()))),
                              DataCell(Center(child: Text(skills[i].name)))
                            ])
                        ]))
              ],
            )
          ],
        ));
  }
}
