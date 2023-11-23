import 'package:flutter/material.dart';
import 'package:harry_potter/screens/character_detail.dart';

import '../models/character.dart';

class CharacterList extends StatelessWidget {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Welcome to Hogwarts",
        ),
      ),
      body: ListView(
        children: [
          for (Character character in characters)
            Padding(
              padding: const EdgeInsets.all(2),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CharacterDetail(
                                character: character,
                              )));
                },
                leading: Hero(
                  tag: character.name,
                  child: Image.network(character.url),
                ),
                title: Text(character.name),
              ),
            ),
        ],
      ),
    );
  }
}
