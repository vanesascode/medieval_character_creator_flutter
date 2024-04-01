import 'package:character_creator/models/skill.dart';
import 'package:character_creator/models/stats.dart';
import 'package:character_creator/models/vocation.dart';

class Character with Stats {
  Character(
      {required this.name,
      required this.slogan,
      required this.vocation,
      required this.id});

  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  bool get isFav => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkills(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}
