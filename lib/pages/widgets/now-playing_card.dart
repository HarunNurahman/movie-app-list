import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../configs/styles.dart';

class NowPlayingCard extends StatelessWidget {
  final String imgUrl;
  final String movieTitle;
  // final String releaseDate;
  final String rating;
  final Function() onTap;
  const NowPlayingCard({
    super.key,
    required this.imgUrl,
    required this.movieTitle,
    // required this.releaseDate,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: CachedNetworkImage(
                imageUrl: imgUrl,
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
            const SizedBox(height: 12),
            // Title
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
            )
          ],
        ),
      ),
    );
  }
}
