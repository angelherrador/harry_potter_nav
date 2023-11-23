import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int i = 1; i <= 5; i++)
          (value >= i)
              ? const Icon(Icons.star)
              : const Icon(Icons.star_border_sharp),
      ],
    );
  }
}
