import "package:character_creator/models/character.dart";
import "package:flutter/material.dart";

class Heart extends StatefulWidget {
  const Heart({super.key, required this.character});

  final Character character;

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(
        tween: Tween(begin: 25, end: 40),
        weight: 50,
      ),
      TweenSequenceItem<double>(
        tween: Tween(begin: 40, end: 25),
        weight: 50,
      ),
    ]).animate(_controller);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite, color: Colors.grey[800]),
        onPressed: () {
          widget.character.toggleIsFav();
        });
  }
}
