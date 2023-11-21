import 'package:flutter/material.dart';
import 'package:harry_potter/models/character.dart';
import 'package:harry_potter/screens/character_detail.dart';

class CharacterList extends StatelessWidget {
  CharacterList({super.key});

  final List<Character> characters = [
    Character(
        name: "Harry Portter",
        url:
            "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1000?cb=20160903184919",
        stars: 3,
        reviews: 50,
        strength: 6,
        speed: 8,
        magic: 9),
    Character(
        name: "Hermione Granger",
        url:
            "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/1200?cb=20120729103114&path-prefix=es",
        stars: 4,
        reviews: 20,
        strength: 6,
        speed: 4,
        magic: 6),
    Character(
        name: "Ron Weasly",
        url:
            "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest/scale-to-width-down/350?cb=20150523213430",
        stars: 1,
        reviews: 75,
        strength: 4,
        speed: 2,
        magic: 3),
    /*Character(
        name: "Evita PadLock",
        url:
            "https://www.modelmanagement.com/blog/wp-content/uploads/2020/11/evaP.jpg",
        stars: 5,
        reviews: 1000,
        strength: 10,
        speed: 10,
        magic: 10),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Welcome to The Jungle',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          for (Character character in characters)
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CharacterDetail(
                                      character: character,
                                    )));
                      },
                      title: Text(character.name),
                      leading: Hero(
                          tag: character.name,
                          child: Image.network(character.url))),
                ),
              ],
            ),
          const Column(children: [
            Text('Este es el final de la cosa'),
          ]),
        ],
      ),
    );
  }
}
