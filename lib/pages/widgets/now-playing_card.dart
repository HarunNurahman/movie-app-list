import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';

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
              child: CachedNetworkImage(imageUrl: imgUrl, fit: BoxFit.cover),
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
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // Movie poster
        //     ClipRRect(
        //       borderRadius: BorderRadius.circular(defaultRadius),
        //       child: CachedNetworkImage(imageUrl: imgUrl),
        //     ),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(
        //         horizontal: 8,
        //         vertical: 16,
        //       ),
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           // Movie title
        //           Text(
        //             movieTitle,
        //             style: blackTextStyle.copyWith(fontWeight: medium),
        //             maxLines: 2,
        //             overflow: TextOverflow.ellipsis,
        //           ),
        //           const SizedBox(height: 6),
        //           // Release date
        //           Text(
        //             releaseDate.toString(),
        //             style: grayTextStyle.copyWith(
        //               fontSize: 12,
        //               fontWeight: light,
        //             ),
        //           )
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
