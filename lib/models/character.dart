import "package:flutter_rpg/models/skill.dart";
import "package:flutter_rpg/models/stats.dart";
import "package:flutter_rpg/models/vocation.dart";

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });

  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFavorite = false;

  // getters
  bool get isFavorite => _isFavorite;

  void toggleIsFavorite() {
    _isFavorite = !_isFavorite;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}
