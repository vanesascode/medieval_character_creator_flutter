import "package:character_creator/screens/create/create.dart";
import "package:character_creator/screens/home/character_card.dart";
import "package:character_creator/services/character_store.dart";
import "package:character_creator/shared/styled_button.dart";
import "package:character_creator/shared/styled_text.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<CharacterStore>(context, listen: false).fetchCharactersOnce();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Your Warriors"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Expanded(
            child: Consumer<CharacterStore>(builder: (context, value, child) {
              return ListView.builder(
                  itemCount: value.characters.length,
                  itemBuilder: (_, index) {
                    return CharacterCard(value.characters[index]);
                  });
            }),
          ),
          StyledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) => const CreateScreen())),
              );
            },
            child: const StyledHeading("Create New"),
          ),
        ]),
      ),
    );
  }
}
