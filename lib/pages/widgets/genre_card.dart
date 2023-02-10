import 'package:flutter/material.dart';

import '../../configs/styles.dart';

class GenreCard extends StatelessWidget {
  final String genre;
  const GenreCard({super.key, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: defaultRadius,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          defaultMargin,
        ),
        color: gray4Color,
      ),
      child: Center(
        child: Text(
          genre,
          style: lightBlueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: bold,
          ),
        ),
      ),
    );
  }
}
