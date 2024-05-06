import "package:character_creator/models/vocation.dart";

class Skill {
  final String id;
  final String name;
  final String image;
  final Vocation vocation;

  Skill({
    required this.id,
    required this.name,
    required this.image,
    required this.vocation,
  });
}

final List<Skill> allSkills = [
  Skill(
      id: "1",
      name: "Hairball Attack",
      image: "cat_skill_1.jpg",
      vocation: Vocation.wizard),
  Skill(
      id: "2",
      name: "Enhanced Senses",
      image: "cat_skill_2.jpg",
      vocation: Vocation.wizard),
  Skill(
      id: "3",
      name: "Nap Time Mastery",
      image: "cat_skill_3.jpg",
      vocation: Vocation.wizard),
  Skill(
      id: "4",
      name: "Tail Whip Technique",
      image: "cat_skill_4.jpg",
      vocation: Vocation.wizard),
  Skill(
      id: "5",
      name: "Sly Shapeshifter",
      image: "fox_skill_1.jpg",
      vocation: Vocation.raider),
  Skill(
      id: "6",
      name: "Cinnamon Cloak",
      image: "fox_skill_2.jpg",
      vocation: Vocation.raider),
  Skill(
      id: "7",
      name: "Forest Whisperer",
      image: "fox_skill_3.jpg",
      vocation: Vocation.raider),
  Skill(
      id: "8",
      name: "Moonlight Prowler",
      image: "fox_skill_4.jpg",
      vocation: Vocation.raider),
  Skill(
      id: "9",
      name: "Duck Tape Defense",
      image: "duck_skill_1.jpg",
      vocation: Vocation.junkie),
  Skill(
      id: "10",
      name: "Waddle Charge",
      image: "duck_skill_2.jpg",
      vocation: Vocation.junkie),
  Skill(
      id: "11",
      name: "Quack Fu Master",
      image: "duck_skill_3.jpg",
      vocation: Vocation.junkie),
  Skill(
      id: "12",
      name: "Pond Portal",
      image: "duck_skill_4.jpg",
      vocation: Vocation.junkie),
  Skill(
      id: "13",
      name: "Bark Blast",
      image: "dog_skill_1.jpg",
      vocation: Vocation.ninja),
  Skill(
      id: "14",
      name: "Frisbee Throwing",
      image: "dog_skill_2.jpg",
      vocation: Vocation.ninja),
  Skill(
      id: "15",
      name: "Paw Prints Precision",
      image: "dog_skill_3.jpg",
      vocation: Vocation.ninja),
  Skill(
      id: "16",
      name: "Water Balloon Throwing",
      image: "dog_skill_4.jpg",
      vocation: Vocation.ninja),
];
