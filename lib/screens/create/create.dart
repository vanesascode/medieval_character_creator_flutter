import 'package:character_creator/models/character.dart';
import 'package:character_creator/models/vocation.dart';
import 'package:character_creator/screens/create/vocation_card.dart';
import 'package:character_creator/shared/styled_button.dart';
import 'package:character_creator/shared/styled_text.dart';
import 'package:character_creator/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
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
    if (_nameController.text.isEmpty || _sloganController.text.isEmpty) {
      return;
    }
    characters.add(Character(
      name: _nameController.text,
      slogan: _sloganController.text,
      vocation: selectedVocation,
      id: uuid.v4(),
    ));
    print(characters.last);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const StyledTitle('Character Creation'),
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
              const Center(child: StyledHeading('Welcome, new player.')),
              const Center(
                child: StyledText('Create a name & slogan for your character.'),
              ),
              const SizedBox(height: 30),
              TextField(
                  controller: _nameController,
                  style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                  cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: StyledText('Character name'))),
              const SizedBox(height: 20),
              TextField(
                  controller: _sloganController,
                  style: GoogleFonts.kanit(
                      textStyle: Theme.of(context).textTheme.bodyMedium),
                  cursorColor: AppColors.textColor,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.chat),
                      label: StyledText('Character slogan'))),
              const SizedBox(height: 30),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryColor,
                ),
              ),
              const Center(child: StyledHeading('Choose a vocation.')),
              const Center(
                child: StyledText('This determines your available skills'),
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
              const Center(child: StyledHeading('Good Luck.')),
              const Center(
                child: StyledText('And enjoy the journey...'),
              ),
              const SizedBox(height: 30),
              Center(
                  child: StyledButton(
                onPressed: handleSubmitCharacterInfo,
                child: const StyledHeading('Create Character'),
              ))
            ]))));
  }
}
