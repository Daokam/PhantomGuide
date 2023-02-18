import 'package:flutter/material.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:phantomguide/services/fusion-service.dart';

class FusionRecipeTable extends StatefulWidget {
  Persona persona;
  FusionRecipeTable(this.persona, {super.key});
  @override
  FusionRecipeTableState createState() => FusionRecipeTableState();
}

class FusionRecipeTableState extends State<FusionRecipeTable> {
  FusionService fusionService = FusionService();
  @override
  Widget build(BuildContext context) {
    List<List<Persona>> fusionRecipes =
        fusionService.getRecipies(widget.persona);
    return Container(
        color: Colors.black,
        margin: const EdgeInsets.only(top: 20),
        width: double.maxFinite,
        child: Column(children: [
          Expanded(
              flex: 2,
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: const Text("Fusion recipes: ",
                      style: TextStyle(color: Colors.white, fontSize: 20)))),
          Expanded(
              flex: 8,
              child: SingleChildScrollView(
                  child: DataTable(
                      dataTextStyle: TextStyle(color: Colors.white),
                      headingRowHeight: 0,
                      columns: <DataColumn>[
                    for (int i = 0; i < 2; i++)
                      const DataColumn(label: Text("")),
                  ],
                      rows: <DataRow>[
                    for (int i = 0; i < fusionRecipes.length; i++)
                      DataRow(cells: <DataCell>[
                        DataCell(Center(
                            child: Text(fusionRecipes[i][0].name,
                                style: TextStyle(fontSize: 20)))),
                        DataCell(Center(
                            child: Text(fusionRecipes[i][1].name,
                                style: TextStyle(fontSize: 20)))),
                      ])
                  ])))
        ]));
  }
}
