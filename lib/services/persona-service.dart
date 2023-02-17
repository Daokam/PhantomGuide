import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:web_scraper/web_scraper.dart';

class PersonaService {
  static final _service = PersonaService._internal();
  static List<Persona> personas = [];
  var listLoaded = ValueNotifier<bool>(false);

  factory PersonaService() => _service;

  PersonaService._internal();

  initPersonas() async {
    if (personas.isNotEmpty) return;
    String data = await rootBundle.loadString('assets/data/P5R/personas.json');
    final jsonResult = jsonDecode(data);
    for (var persona in jsonResult) {
      personas.add(Persona.fromJson(persona));
    }
    listLoaded.value = true;
  }

  List<Persona> getPersonas() {
    return personas;
  }

  Image getPersonaIcon(String name) {
    String arcana = name.toLowerCase();
    return Image.asset('assets/icons/P5R/$arcana.webp');
  }

  getPersonaImage(String name) async {
    final webScraper = WebScraper('https://megamitensei.fandom.com');
    if (await webScraper.loadWebPage('/wiki/$name')) {
      List<Map<String, dynamic>> elements =
          webScraper.getElement('img.pi-image-thumbnail', ['src']);
      return (elements[0]['attributes']['src']);
    }
  }
}
