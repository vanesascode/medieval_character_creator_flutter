enum Vocation {
  raider(
      title: "Fox champion",
      description:
          "Uses its bushy tail as a weapon to create a whirlwind that knocks down opponents.",
      weapon: "Acorn Arsenal",
      ability: "Illusionary Mirage",
      image: "fox_champion.jpg"),
  junkie(
      title: "Duck master",
      description: "Unleashes a powerful quack that stuns enemies temporarily.",
      weapon: "Spear",
      ability: "Feathery Fury",
      image: "duck_master.jpg"),
  ninja(
      title: "Dog knight",
      description:
          "Can crush bones with ease, using their powerful jaws to snap bones like twigs.",
      weapon: "Mace",
      ability: "Sniffing Sleuthing",
      image: "dog_knight.jpg"),
  wizard(
      title: "Cat fighter",
      description:
          "Expert in combat, using his sharp claws and agility to take down enemies.",
      weapon: "Rapier",
      ability: "Human enslavement",
      image: "cat_fighter.jpg");

  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}
