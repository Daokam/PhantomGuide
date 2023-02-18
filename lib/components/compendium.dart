import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:phantomguide/components/persona-item.dart';
import 'package:phantomguide/components/persona-page/persona-page.dart';
import 'package:phantomguide/services/persona-service.dart';

import 'compendium-search.dart';

class Compendium extends StatefulWidget {
  @override
  CompendiumState createState() => CompendiumState();
}

class CompendiumState extends State<Compendium> {
  PersonaService personaService = PersonaService();
  bool personaClicked = false;
  int currentPersona = 0;

  @override
  Widget build(BuildContext context) {
    return getCurrentPage();
  }

  Widget getCurrentPage() {
    if (personaClicked) {
      return PersonaPage(
        persona: personaService.getPersonas()[currentPersona],
        toggleSearchPage: toggleSearchPage,
      );
    } else {
      return CompendiumSearch(
        togglePersonaPage: togglePersonaPage,
      );
    }
  }

  togglePersonaPage(int personaIndex) {
    if (!mounted) return;

    setState(() {
      personaClicked = true;
      currentPersona = personaIndex;
    });
  }

  toggleSearchPage() {
    if (!mounted) return;

    setState(() {
      personaClicked = false;
    });
  }
}
