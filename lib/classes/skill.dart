class Skill {
  String name;
  num level;

  Skill(this.name, this.level);

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(json['name'], json['level']);
  }
}
