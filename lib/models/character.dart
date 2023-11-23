class Character {
  final String name;
  final String url;
  double get stars => totalStars / reviews; //un get hace como un campo calculado
  int totalStars;
  int reviews;
  int strength;
  int magic;
  int speed;

  Character({
    required this.name,
    required this.url,
    this.totalStars = 0,
    this.reviews = 0,
    this.strength = 0,
    this.magic = 0,
    this.speed = 0,
  });

  void addRating(int value) {
    reviews++;
    totalStars += value;
  }
}

final List<Character> characters = [
  Character(
    name: "Harry Potter",
    url:
    "https://static.wikia.nocookie.net/esharrypotter/images/8/8d/PromoHP7_Harry_Potter.jpg/revision/latest/scale-to-width-down/1200?cb=20160903184919",
    strength: 6,
    speed: 8,
    magic: 9,
  ),
  Character(
    name: "Hermione Granger",
    url:
    "https://static.wikia.nocookie.net/warnerbros/images/3/3e/Hermione.jpg/revision/latest/scale-to-width-down/399?cb=20120729103114&path-prefix=es",
    strength: 8,
    speed: 10,
    magic: 10,
  ),
  Character(
    name: "Ron Weasly",
    url:
    "https://static.wikia.nocookie.net/esharrypotter/images/6/69/P7_promo_Ron_Weasley.jpg/revision/latest?cb=20150523213430",
    strength: 4,
    speed: 6,
    magic: 7,
  ),
  Character(
      name: "Evita PadLock",
      url:
      "https://www.modelmanagement.com/blog/wp-content/uploads/2020/11/evaP.jpg",
      strength: 10,
      speed: 10,
      magic: 10),
];