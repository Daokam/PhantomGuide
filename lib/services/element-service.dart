import 'package:flutter/material.dart';

class ElementService {
  static final _service = ElementService._internal();

  factory ElementService() => _service;

  ElementService._internal();

  List<String> getElements() {
    return [
      'melee',
      'gun',
      'fire',
      'ice',
      'elec',
      'wind',
      'psy',
      'nuke',
      'bless',
      'curse'
    ];
  }

  Image getElementIcon(String name) {
    String element = name.toLowerCase();
    return Image.asset('assets/icons/P5R/elements/$element.webp');
  }
}
