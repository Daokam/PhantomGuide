import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:web_scraper/web_scraper.dart';

class PersonaService {
  static final _service = PersonaService._internal();
  static List<Persona> personas = [];
  static List<Persona> filteredPersonas = [];

  factory PersonaService() => _service;

  PersonaService._internal();

  initPersonas() async {
    if (personas.isNotEmpty) return;
    String data = await rootBundle.loadString('assets/data/P5R/personas.json');
    final jsonResult = jsonDecode(data);
    for (var persona in jsonResult) {
      personas.add(Persona.fromJson(persona));
    }
    filteredPersonas = personas;
  }

  List<Persona> getPersonas() {
    return filteredPersonas;
  }

  Image getPersonaIcon(String name) {
    String arcana = name.toLowerCase();
    return Image.asset('assets/icons/P5R/arcana/$arcana.webp');
  }

  searchPersonas(string) {
    filteredPersonas = personas.where((persona) {
      if (persona.arcana.toLowerCase().contains(string.toLowerCase())) {
        return true;
      } else if (persona.name.toLowerCase().contains(string.toLowerCase())) {
        return true;
      } else if (persona.level.toString().contains(string.toLowerCase())) {
        return true;
      }
      return false;
    }).toList();
  }

  clearSearch() {
    filteredPersonas = personas;
  }

  getFusionResult(Persona persona1, Persona persona2) {}

  List<Persona> getPersonaByArcana(String arcana) {
    return personas.where((persona) => persona.arcana == arcana).toList();
  }

  getArcanaResult(String arcana1, String arcana2) {}
}
