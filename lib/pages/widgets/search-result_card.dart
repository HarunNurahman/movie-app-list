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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: defaultMargin,
          right: defaultMargin,
        ),
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
                imageBuilder: (context, imageProvider) => Container(
                  width: 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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
                errorWidget: (context, url, error) => Icon(
                  Icons.highlight_remove_outlined,
                  color: blueColor,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
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
