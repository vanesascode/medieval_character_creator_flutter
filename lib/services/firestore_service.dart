import 'package:character_creator/models/character.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection('characters')
      .withConverter(
          fromFirestore: Character.fromFirestore,
          toFirestore: (Character character, options) =>
              character.toFirestore());

  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }
}
