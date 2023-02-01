import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/bloc/detail-movie_bloc/detail_movie_bloc.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';

class PopularCard extends StatelessWidget {
  MovieModel? detailMovie;
  final String imgUrl;
  final String movieTitle;
  final String rating;
  final Function() onTap;
  PopularCard({
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
                fit: BoxFit.cover,
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
                    const SizedBox(height: 8),
                    // Genres
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: defaultRadius,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  defaultMargin,
                                ),
                                color: gray4Color),
                            child: Text(
                              'Genre 1',
                              style: lightBlueTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: defaultRadius,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  defaultMargin,
                                ),
                                color: gray4Color),
                            child: Text(
                              'Genre 2',
                              style: lightBlueTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: defaultRadius,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  defaultMargin,
                                ),
                                color: gray4Color),
                            child: Text(
                              'Genre 3',
                              style: lightBlueTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Movie Duration
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: blackColor,
                          size: 10,
                        ),
                        Text(
                          '170 Minutes',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
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
