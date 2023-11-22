import 'package:flutter/material.dart';

import '../models/character.dart';

class CharacterDetail extends StatelessWidget {
  const CharacterDetail({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    var imageWidth =
        MediaQuery.of(context).size.width * 0.80; //80% del ancho de pantalla

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title:
            Text(character.name,),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        //to el body scrollable
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, //hará que todos los elementos
          // de la col se dispongan ocupando to el alto de la pantalla
          children: [
            Hero(
              tag: character.name,
              child: Image.network(
                character.url,
                width: imageWidth,
              ),
            ),
            Text(
              character.name,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    for (int i = 1; i <= 5; i++)
                      (character.stars >= i)
                          ? const Icon(Icons.star)
                          : const Icon(Icons.star_border_sharp),
                  ],
                ),
                Text("${character.reviews} reviews"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Icon(Icons.fitness_center),
                    const Text("Força"),
                    Text("${character.strength}"), //convert int a texto
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.auto_fix_normal),
                    const Text("Màgia"),
                    Text("${character.magic}"), //convert int a texto
                  ],
                ),
                Column(
                  children: [
                    const Icon(Icons.speed),
                    const Text("Velocitat"),
                    Text(character.speed.toString()), //convert int a texto
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
