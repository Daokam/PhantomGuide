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

class CompendiumState extends State<Compendium> with TickerProviderStateMixin {
  PersonaService personaService = PersonaService();
  bool personaClicked = false;
  int currentPersona = 0;
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(-1.0, 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (personaClicked)
          PersonaPage(
            persona: personaService.getPersonas()[currentPersona],
            toggleSearchPage: toggleSearchPage,
          ),
        SlideTransition(
            position: _animation,
            child: CompendiumSearch(
              togglePersonaPage: togglePersonaPage,
            )),
      ],
    );
  }

  Widget getCurrentPage() {
    if (personaClicked) {
      return PersonaPage(
        persona: personaService.getPersonas()[currentPersona],
        toggleSearchPage: toggleSearchPage,
      );
    } else {
      return SlideTransition(
          position: _animation,
          child: CompendiumSearch(
            togglePersonaPage: togglePersonaPage,
          ));
    }
  }

  togglePersonaPage(int personaIndex) {
    if (!mounted) return;

    setState(() {
      personaClicked = true;
      currentPersona = personaIndex;
      _controller.forward();
    });
  }

  toggleSearchPage() {
    if (!mounted) return;

    setState(() {
      _controller.reverse().whenComplete(() => {
            setState(() {
              personaClicked = false;
            })
          });
    });
  }
}
