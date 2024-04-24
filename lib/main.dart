import "package:character_creator/screens/home/home.dart";
import "package:character_creator/services/character_store.dart";
import "package:character_creator/theme.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CharacterStore(),
    child: MaterialApp(
      theme: primaryTheme,
      home: const Home(),
    ),
  ));
}
