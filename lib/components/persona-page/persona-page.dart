import 'package:flutter/material.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:phantomguide/classes/skill.dart';
import 'package:phantomguide/components/persona-page/affinity-table.dart';
import 'package:phantomguide/components/persona-page/basic-info.dart';
import 'package:phantomguide/components/persona-page/fusion-buttons.dart';
import 'package:phantomguide/components/persona-page/fusion-recipe-table.dart';
import 'package:phantomguide/components/persona-page/persona-header.dart';
import 'package:phantomguide/components/persona-page/skills-table.dart';
import 'package:phantomguide/components/persona-page/stat-area.dart';
import 'package:phantomguide/services/persona-service.dart';

class PersonaPage extends StatelessWidget {
  PersonaService personaService = PersonaService();
  Persona persona;
  Function() toggleSearchPage;

  PersonaPage(
      {super.key, required this.persona, required this.toggleSearchPage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onPanUpdate: (details) {
          // Swiping in right direction.
          if (details.delta.dx > 0) {
            toggleSearchPage();
          }

          // Swiping in left direction.
          if (details.delta.dx < 0) {}
        },
        child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.black,
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: PersonaHeader(
                      name: persona.name,
                      toggleSearchPage: () => toggleSearchPage())),
              Expanded(
                  flex: 9,
                  child: Container(
                      width: double.maxFinite,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                flex: 9,
                                child: SingleChildScrollView(
                                    child: Column(children: [
                                  BasicInfo(persona: persona),
                                  AffinityTable(affinities: persona.elems),
                                  SkillsTable(skills: persona.skills),
                                  StatArea(stats: persona.stats),
                                ]))),
                            Expanded(flex: 1, child: FusionButtons())
                          ])))
            ])));
  }
}
