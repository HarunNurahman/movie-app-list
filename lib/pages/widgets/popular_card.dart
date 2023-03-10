import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../configs/styles.dart';

class PopularCard extends StatelessWidget {
  final String imgUrl;
  final String movieTitle;
  final String rating;
  final String releaseDate;
  final ListView genreList;
  final Function() onTap;
  const PopularCard({
    super.key,
    required this.imgUrl,
    required this.movieTitle,
    required this.rating,
    required this.releaseDate,
    required this.onTap,
    required this.genreList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
                width: 100,
                placeholder: (context, url) => SizedBox(
                  child: Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: blueColor,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 140,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/error-404.png',
                      ),
                    ),
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Movie Title
                    Text(
                      movieTitle,
                      style: blackTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: semiBold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    // Rating
                    Row(
                      children: [
                        Icon(Icons.star, color: yellowColor, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '$rating/10',
                          style: subtitleTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Release Date
                    Text(
                      'Release Date - $releaseDate',
                      style: blackTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: light,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      height: 24,
                      margin: EdgeInsets.only(top: defaultMargin),
                      child: genreList,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
