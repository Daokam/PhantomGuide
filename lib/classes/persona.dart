import 'package:phantomguide/classes/skill.dart';

class Persona {
  String name;
  num level;
  String arcana;
  List<String> elems;
  List<Skill> skills;
  List<num> stats;
  String trait;
  bool dlc;

  Persona(this.name, this.level, this.arcana, this.elems, this.skills,
      this.stats, this.trait, this.dlc);

  factory Persona.fromJson(Map<String, dynamic> json) {
    List<String> elems = [];
    for (var elem in json['elems']) {
      elems.add(elem);
    }
    List<Skill> skills = [];
    for (var skill in json['skills']) {
      skills.add(Skill.fromJson(skill));
    }
    List<num> stats = [];
    for (var stat in json['stats']) {
      stats.add(stat);
    }
    return Persona(json['name'], json['level'], json['arcana'], elems, skills,
        stats, json['trait'], json['dlc']);
  }
}
