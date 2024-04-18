import "package:character_creator/models/character.dart";
import "package:character_creator/screens/profile/profile.dart";
import "package:character_creator/shared/styled_text.dart";
import "package:character_creator/theme.dart";
import "package:flutter/material.dart";

class CharacterCard extends StatelessWidget {
  const CharacterCard(this.character, {super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Image.asset("assets/img/vocations/${character.vocation.image}",
              width: 80),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyledHeading(character.name),
              StyledText(character.vocation.title)
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(character: character)));
              },
              icon: Icon(Icons.arrow_forward, color: AppColors.textColor))
        ],
      ),
    ));
  }
}
