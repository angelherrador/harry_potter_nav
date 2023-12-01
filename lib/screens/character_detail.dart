import 'package:flutter/material.dart';
import 'package:harry_potter/providers/hogwarts_data.dart';
import 'package:provider/provider.dart';
import '../widgets/rating.dart';

class CharacterDetail extends StatefulWidget {
  const CharacterDetail({super.key, required this.id});

  final int id;

  @override
  State<CharacterDetail> createState() => _CharacterDetailState();
}

class _CharacterDetailState extends State<CharacterDetail> {
  int lastRating = 0;
  int lastStrength = 0;
  int lastMagic = 0;
  int lastSpeed = 0;

  @override
  Widget build(BuildContext context) {
    var imageWidth =
        MediaQuery.of(context).size.width *0.90; //% del ancho de pantalla

    return Consumer<HogwartsData>(builder: (context, data, child) {
      final character = data.getCharacter(widget.id);
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(character.name),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Hero(
                tag: character.name,
                child: Image.network(character.url,width: imageWidth,height: imageWidth,),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(value: character.stars),
                  Text("${character.reviews} reviews"),
                ],
              ),
              Text('${character.name} - ${character.id}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Rating(
                      value: lastRating.toDouble(),
                      onStarClicked: (value) {
                        lastRating = value;
                        data.addRating(character, value);
                        setState(() {});
                      }),
                  InkWell(
                      onTap: () {
                        data.toggleFavorite(character.id);
                         Navigator.pop(context);
                      },
                      child: Icon(
                        (character.favorite)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.deepPurple,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      lastStrength = character.strength;
                      data.addStrength(character, lastStrength);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.fitness_center),
                        const Text("Força"),
                        Text("${character.strength}"),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      lastMagic = character.magic;
                      data.addMagic(character, lastMagic);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.auto_fix_normal),
                        const Text("Màgia"),
                        Text(character.magic.toString()),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      lastSpeed = character.speed;
                      data.addSpeed(character, lastSpeed);
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        const Icon(Icons.speed),
                        const Text("Velocitat"),
                        Text(character.speed.toString()),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
