import 'package:flutter/material.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:phantomguide/services/persona-service.dart';

class PersonaItem extends StatelessWidget {
  Persona persona;
  PersonaService personaService = PersonaService();
  Function(int) togglePersonaPage;
  int personaIndex;

  PersonaItem(
      {super.key,
      required this.persona,
      required this.personaIndex,
      required this.togglePersonaPage});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: 150,
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
            onPressed: () => togglePersonaPage(personaIndex),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Row(children: [
                  personaService.getPersonaIcon(persona.arcana),
                  Container(
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(persona.name,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromRGBO(255, 5, 5, 1))),
                          Text(persona.arcana,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                              )),
                          Text("Level: ${persona.level}",
                              style: const TextStyle(color: Colors.black)),
                        ],
                      ))
                ])),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                )
              ],
            )));
  }
}
