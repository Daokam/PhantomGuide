import 'package:flutter/material.dart';
import 'package:phantomguide/classes/persona.dart';

class BasicInfo extends StatelessWidget {
  Persona persona;

  BasicInfo({super.key, required this.persona});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        width: double.maxFinite,
        height: 40,
        child: Row(
          children: [
            Expanded(
                flex: 5,
                child: Center(
                    child: Text(
                  'Lv. ${persona.level}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ))),
            Expanded(
                flex: 5,
                child: Center(
                    child: Text(persona.arcana,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)))),
          ],
        ));
  }
}
