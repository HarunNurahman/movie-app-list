import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';

class SearchResultCard extends StatelessWidget {
  final String imgUrl;
  final String movieTitle;
  final String rating;
  final Function() onTap;
  const SearchResultCard({
    super.key,
    required this.imgUrl,
    required this.movieTitle,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: defaultMargin,
        vertical: defaultRadius,
      ),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(defaultRadius),
        border: Border.all(width: 1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadius),
            child: Container(
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              child: CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTitle,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Text(
                      rating,
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semiBold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
