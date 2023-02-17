import 'package:flutter/material.dart';
import 'package:phantomguide/components/persona-item.dart';
import 'package:phantomguide/services/persona-service.dart';

class CompendiumSearch extends StatefulWidget {
  final Function(int) togglePersonaPage;
  CompendiumSearch({super.key, required this.togglePersonaPage});
  @override
  CompendiumSearchState createState() => CompendiumSearchState();
}

class CompendiumSearchState extends State<CompendiumSearch> {
  PersonaService personaService = PersonaService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPersonas();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.red,
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 350,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Search',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ))),
          Expanded(
              flex: 7,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: personaService.getPersonas().length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 5, right: 5),
                        child: PersonaItem(
                          persona: personaService.getPersonas()[index],
                          personaIndex: index,
                          togglePersonaPage: widget.togglePersonaPage,
                        ));
                  }))
        ]));
  }

  initPersonas() async {
    await personaService.initPersonas();
    setState(() {});
  }
}
