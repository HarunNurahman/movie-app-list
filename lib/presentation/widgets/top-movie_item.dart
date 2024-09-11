import 'package:flutter/material.dart';

class TopMovieItem extends StatelessWidget {
  final String imgUrl;
  final String imgNumber;
  const TopMovieItem(
      {super.key, required this.imgUrl, required this.imgNumber});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      height: 240,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imgUrl,
              width: 144,
            ),
          ),
          Positioned(
            top: 150,
            child: Image.asset('assets/icons/ic_$imgNumber.png', height: 90),
          )
        ],
      ),
    );
  }
}
