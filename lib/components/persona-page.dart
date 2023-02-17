import 'package:flutter/material.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:phantomguide/services/persona-service.dart';

class PersonaPage extends StatelessWidget {
  PersonaService personaService = PersonaService();
  Persona persona;
  Function() toggleSearchPage;

  PersonaPage(
      {super.key, required this.persona, required this.toggleSearchPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: Column(children: [
          Container(
              color: Colors.red,
              width: double.maxFinite,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Material(
                                color: Colors.transparent,
                                child: IconButton(
                                    splashRadius: 25,
                                    onPressed: () => toggleSearchPage(),
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ))))),
                    Expanded(
                        flex: 6,
                        child: Center(
                            child: Text(persona.name,
                                style: const TextStyle(
                                    fontSize: 30, color: Colors.white)))),
                    Expanded(flex: 2, child: SizedBox())
                  ])),
          FutureBuilder(
            future: personaService.getPersonaImage(persona.name),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Image.network(snapshot.data.toString(),
                    width: 300, height: 300);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ]));
  }
}
