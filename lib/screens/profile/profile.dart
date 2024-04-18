import "package:character_creator/models/character.dart";
import "package:character_creator/screens/profile/skill_list.dart";
import "package:character_creator/screens/profile/stats_table.dart";
import "package:character_creator/shared/styled_button.dart";
import "package:character_creator/shared/styled_text.dart";
import "package:character_creator/theme.dart";
import "package:flutter/material.dart";

class Profile extends StatelessWidget {
  const Profile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              color: AppColors.secondaryColor.withOpacity(0.3),
              child: Row(
                children: [
                  Image.asset(
                    "assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: AppColors.secondaryColor.withOpacity(0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    const SizedBox(height: 10),
                    const StyledHeading("Weapon of Choice"),
                    StyledText(character.vocation.weapon),
                    const SizedBox(height: 10),
                    const StyledHeading("Unique Ability"),
                    StyledText(character.vocation.ability),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(children: [
                StatsTable(character),
                SkillList(character),
              ]),
            ),
            StyledButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const StyledHeading("Character saved!"),
                      showCloseIcon: true,
                      duration: const Duration(seconds: 2),
                      backgroundColor: AppColors.secondaryColor));
                },
                child: const StyledHeading("Save Character")),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
