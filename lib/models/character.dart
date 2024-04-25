import "package:character_creator/models/skill.dart";
import "package:character_creator/models/stats.dart";
import "package:character_creator/models/vocation.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class Character with Stats {
  Character(
      {required this.name,
      required this.slogan,
      required this.vocation,
      required this.id});

  @override
  String toString() {
    return "Name: $name, Slogan: $slogan, Vocation: $vocation, ID: $id";
  }

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

  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "slogan": slogan,
      "isFav": _isFav,
      "vocation": vocation.toString(),
      "skills": skills.map((skill) => skill.id).toList(),
      "stats": statsAsMap,
      "points": points
    };
  }

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data()!;

    Character character = Character(
      name: data["name"],
      slogan: data["slogan"],
      id: snapshot.id,
      vocation: Vocation.values
          .firstWhere((vocation) => vocation.toString() == data["vocation"]),
    );

    for (String id in data["skills"]) {
      Skill skill = allSkills.firstWhere((element) => element.id == id);
      character.skills.add(skill);
    }

    if (data["isFav"] != true) {
      character.toggleIsFav();
    }

    return character;
  }
}

List<Character> characters = [
  Character(
      id: "1", name: "Klara", vocation: Vocation.wizard, slogan: "Kapumf!"),
  Character(
      id: "2",
      name: "Jonny",
      vocation: Vocation.junkie,
      slogan: "Light me up..."),
  Character(
      id: "3",
      name: "Crimson",
      vocation: Vocation.raider,
      slogan: "Fire in the hole!"),
  Character(
      id: "4",
      name: "Shaun",
      vocation: Vocation.ninja,
      slogan: "Alright then gang."),
];
