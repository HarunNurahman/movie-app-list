import 'package:flutter/material.dart';

class TopMovieItem extends StatelessWidget {
  final String imgUrl;
  final String imgNumber;
  final VoidCallback? onTap;
  const TopMovieItem({
    super.key,
    required this.imgUrl,
    required this.imgNumber,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        height: 240,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(imgUrl, height: 210),
            ),
            Positioned(
              top: 150,
              child: Image.asset('assets/icons/ic_$imgNumber.png', height: 90),
            )
          ],
        ),
      ),
    );
  }
}
