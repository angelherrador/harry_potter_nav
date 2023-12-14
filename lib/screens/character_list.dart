
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/character.dart';
import '../providers/hogwarts_data.dart';
import 'character_detail.dart';

class CharacterList extends StatefulWidget {
   const CharacterList({super.key});

  @override
  State<CharacterList> createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          "Welcome To Hogwarts",
        ),
      ),
      body: Consumer<HogwartsData>(builder: (context, data, child) {
          return ListView(
            children: [
              for (Character character in data.characters)
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CharacterDetail(
                                    id: character.id,
                                  )));
                    },
                    leading: Hero(
                      tag: character.name,
                      child: Image.network(character.url),
                    ),
                    title: Text('${character.id} - ${character.name}'),
                    subtitle: Text('${character.reviews} reviews'),
                    trailing: Icon(
                      (character.favorite)
                          ? Icons.favorite
                          : Icons.favorite_border, color: Colors.deepPurple,
                    ),
                  ),
                ),
            ],
          );
        }
      ),
    );
  }
}
