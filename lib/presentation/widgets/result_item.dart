import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';

class ResultItem extends StatelessWidget {
  final String imgUrl;
  final String movieTitle;
  final String rating;
  final String genre;
  final String releaseDate;
  final String duration;
  const ResultItem({
    super.key,
    required this.imgUrl,
    required this.movieTitle,
    required this.rating,
    required this.genre,
    required this.releaseDate,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        children: [
          // Movie poster
          Container(
            height: 150,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Movie information
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Movie title
              Text(
                movieTitle,
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(height: 14),
              // Movie rating
              movieInfoItem(
                image: 'assets/icons/ic_star.png',
                color: orangeColor,
                name: rating,
              ),
              const SizedBox(height: 4),
              // Movie genre
              movieInfoItem(
                image: 'assets/icons/ic_ticket.png',
                name: genre,
              ),
              const SizedBox(height: 4),
              // Movie year
              movieInfoItem(
                image: 'assets/icons/ic_year.png',
                name: releaseDate,
              ),
              const SizedBox(height: 4),
              // Movie duration
              movieInfoItem(
                image: 'assets/icons/ic_duration.png',
                name: duration,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget movieInfoItem({String? image, String? name, Color? color}) {
    return Row(
      children: [
        Image.asset(image!, width: 20, color: color),
        const SizedBox(width: 8),
        Text(
          name!,
          style: whiteTextStyle.copyWith(color: color),
        ),
      ],
    );
  }
}
