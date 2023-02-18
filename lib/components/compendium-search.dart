import 'package:flutter/material.dart';
import 'package:phantomguide/components/persona-item.dart';
import 'package:phantomguide/services/fusion-service.dart';
import 'package:phantomguide/services/persona-service.dart';

class CompendiumSearch extends StatefulWidget {
  final Function(int) togglePersonaPage;
  CompendiumSearch({super.key, required this.togglePersonaPage});
  @override
  CompendiumSearchState createState() => CompendiumSearchState();
}

class CompendiumSearchState extends State<CompendiumSearch> {
  PersonaService personaService = PersonaService();
  FusionService fusionService = FusionService();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
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
                  child: TextField(
                    onChanged: (text) {
                      searchPersonas(text);
                    },
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search',
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

  init() async {
    await personaService.initPersonas();
    await fusionService.initArcanaCombos();
    setState(() {});
  }

  searchPersonas(String query) {
    if (searchController.text.isEmpty) {
      setState(() {
        personaService.clearSearch();
      });
    } else {
      setState(() {
        personaService.searchPersonas(query);
      });
    }
  }
}
