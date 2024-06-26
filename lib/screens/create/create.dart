import "package:character_creator/models/character.dart";
import "package:character_creator/models/vocation.dart";
import "package:character_creator/screens/create/vocation_card.dart";
import "package:character_creator/screens/home/home.dart";
import "package:character_creator/services/character_store.dart";
import "package:character_creator/shared/styled_button.dart";
import "package:character_creator/shared/styled_text.dart";
import "package:character_creator/theme.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:provider/provider.dart";
import "package:uuid/uuid.dart";

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  Vocation selectedVocation = Vocation.junkie;

  void handleVocationChange(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmitCharacterInfo() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading("Missing Character Name"),
              content:
                  const StyledText("Please enter a name for your warrior."),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeading("OK"),
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });

      return;
    }
    if ((_sloganController.text.trim().isEmpty)) {
      showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const StyledHeading("Missing Character Slogan"),
              content:
                  const StyledText("Please enter a slogan for your warrior."),
              actions: [
                StyledButton(
                  onPressed: () {
                    Navigator.pop(ctx);
                  },
                  child: const StyledHeading("OK"),
                )
              ],
              actionsAlignment: MainAxisAlignment.center,
            );
          });
      return;
    }
    Provider.of<CharacterStore>(context, listen: false).addCharacter(Character(
      name: _nameController.text.trim(),
      slogan: _sloganController.text.trim(),
      vocation: selectedVocation,
      id: uuid.v4(),
    ));
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const StyledTitle("Warrior Creation"),
          centerTitle: true,
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: SingleChildScrollView(
                child: Column(children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(child: StyledHeading("Welcome, new player.")),
              const Center(
                child: StyledText("Create a name & slogan for your warrrior."),
              ),
              const SizedBox(height: 30),
              TextField(
                  controller: _nameController,
                  style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                  cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: StyledText("Character name"))),
              const SizedBox(height: 20),
              TextField(
                  controller: _sloganController,
                  style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                  cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.chat),
                      label: StyledText("Character slogan"))),
              const SizedBox(height: 30),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(child: StyledHeading("Choose a vocation.")),
              const Center(
                child: StyledText("This determines your available skills"),
              ),
              const SizedBox(height: 30),
              VocationCard(
                  selected: selectedVocation == Vocation.junkie,
                  onTap: handleVocationChange,
                  vocation: Vocation.junkie),
              VocationCard(
                  selected: selectedVocation == Vocation.ninja,
                  onTap: handleVocationChange,
                  vocation: Vocation.ninja),
              VocationCard(
                  selected: selectedVocation == Vocation.raider,
                  onTap: handleVocationChange,
                  vocation: Vocation.raider),
              VocationCard(
                  selected: selectedVocation == Vocation.wizard,
                  onTap: handleVocationChange,
                  vocation: Vocation.wizard),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(child: StyledHeading("Good Luck.")),
              const Center(
                child: StyledText("And enjoy the journey..."),
              ),
              const SizedBox(height: 30),
              Center(
                  child: StyledButton(
                onPressed: handleSubmitCharacterInfo,
                child: const StyledHeading("Create Character"),
              ))
            ]))));
  }
}
