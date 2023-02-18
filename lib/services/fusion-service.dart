import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phantomguide/classes/arcanaCombo.dart';
import 'package:phantomguide/classes/persona.dart';
import 'package:phantomguide/services/persona-service.dart';
import 'package:web_scraper/web_scraper.dart';

class FusionService {
  static final _service = FusionService._internal();
  static List<ArcanaCombo> arcanaCombos = [];
  PersonaService personaService = PersonaService();

  factory FusionService() => _service;

  FusionService._internal();

  initArcanaCombos() async {
    if (arcanaCombos.isNotEmpty) return;
    String data =
        await rootBundle.loadString('assets/data/P5R/arcanaCombos.json');
    final jsonResult = jsonDecode(data);
    for (var arcanaCombo in jsonResult) {
      arcanaCombos.add(ArcanaCombo.fromJson(arcanaCombo));
    }
  }

  getFusionResult(Persona persona1, Persona persona2) {
    int level = ((persona1.level + persona2.level) / 2).floor() + 1;
    String resultArcana = getArcanaResult(persona1.arcana, persona2.arcana);
    List<Persona> possibleResults =
        personaService.getPersonaByArcana(resultArcana);
    possibleResults.sort((a, b) => a.level.compareTo(b.level));
    if (persona1.arcana == persona2.arcana) {
      for (int i = possibleResults.length - 1; i >= 0; i--) {
        if (possibleResults[i].level <= level &&
            persona1.name != possibleResults[i].name &&
            persona2.name != possibleResults[i].name) {
          return possibleResults[i];
        }
      }
    } else {
      for (int i = 0; i <= possibleResults.length - 1; i++) {
        if (possibleResults[i].level >= level &&
            persona1.name != possibleResults[i].name &&
            persona2.name != possibleResults[i].name) {
          return possibleResults[i];
        }
      }
    }
    return null;
  }

  getArcanaResult(String arcana1, String arcana2) {
    return arcanaCombos
        .firstWhere((element) =>
            element.sources.contains(arcana1) &&
            element.sources.contains(arcana2))
        .result;
  }

  getRecipies(Persona persona) {
    List<List<Persona>> recipies = [];
    List<ArcanaCombo> personaArcanaCombos = arcanaCombos
        .where((element) => element.result == persona.arcana)
        .toList();

    for (ArcanaCombo arcanaCombo in personaArcanaCombos) {
      List<Persona> possibleSource1 =
          personaService.getPersonaByArcana(arcanaCombo.sources[0]);
      List<Persona> possibleSource2 =
          personaService.getPersonaByArcana(arcanaCombo.sources[1]);
      for (Persona persona1 in possibleSource1) {
        for (Persona persona2 in possibleSource2) {
          if (persona1.name == persona.name ||
              persona2.name == persona.name ||
              persona1.name == persona2.name) continue;
          Persona? fusionResult = getFusionResult(persona1, persona2);
          if (fusionResult != null && fusionResult.name == persona.name) {
            recipies.add([persona1, persona2]);
          }
        }
      }
    }
    return recipies;
  }
}
