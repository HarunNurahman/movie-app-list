import 'package:flutter/material.dart';

class MovieListItem extends StatelessWidget {
  final String imgUrl;
  const MovieListItem({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage(imgUrl), fit: BoxFit.cover),
      ),
    );
  }
}
