import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
    this.onStarClicked, //no lleva el required pq pue se null
  });

  final double value;
  final Function(int)? onStarClicked; // el ? para que pueda ser null

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 1; i <= 5; i++)
          InkWell(
              onTap: () {
                if (onStarClicked != null) onStarClicked!(i);
              },
              child: (value >= i)
                  ? Icon(Icons.star,
                      color: (onStarClicked == null)
                          ? Colors.black
                          : Colors.deepPurple)
                  : Icon(Icons.star_border_sharp,
                      color: (onStarClicked == null)
                          ? Colors.black
                          : Colors.deepPurple))
      ],
    );
  }
}
