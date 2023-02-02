import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/pages/widgets/genre_card.dart';

import '../bloc/detail-movie_bloc/detail_movie_bloc.dart';
import '../models/movie_model.dart';

class DetailMoviePage extends StatelessWidget {
  final MovieModel detailMovie;
  const DetailMoviePage({super.key, required this.detailMovie});

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original';

    Widget backgroundImage() {
      Widget backdropShadow() {
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                blackColor.withOpacity(0),
                blackColor.withOpacity(0.65),
              ],
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              '$imgUrl/${detailMovie.backdropPath}',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: backdropShadow(),
      );
    }

    Widget header() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.arrow_back_ios, color: whiteColor, size: 24),
                Icon(Icons.more_horiz, color: whiteColor, size: 24)
              ],
            ),
            const SizedBox(height: 60),
            Center(
              child: Column(
                children: [
                  Image.asset('assets/icons/ic_play.png', width: 45),
                  const SizedBox(height: 8),
                  Text(
                    'Play Trailer',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieLoading) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              ),
            );
          } else if (state is DetailMovieSuccess) {
            DetailMovieModel detailMovieModel = state.detailMovie;
            return Container(
              margin: const EdgeInsets.only(top: 240),
              padding: EdgeInsets.all(defaultMargin),
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultRadius),
                  topRight: Radius.circular(defaultRadius),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie Title
                  Text(
                    detailMovie.title!,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: yellowColor, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        '${detailMovie.voteAverage.toString()}/10 IMDb',
                        style: subtitleTextStyle.copyWith(fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Genre
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        children: detailMovieModel.genres!
                            .map(
                              (genre) => GenreCard(genre: genre.name!),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Movie Duration
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${detailMovieModel.runtime.toString()} Minutes',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
                      //
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Duration',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${detailMovieModel.runtime.toString()} Minutes',
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        detailMovieModel.overview!,
                        style: subtitleTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: light,
                        ),
                        textAlign: TextAlign.justify,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    return BlocProvider(
      create: (context) => DetailMovieBloc(detailMovie.id!)
        ..add(
          DetailMovieEventStarted(detailMovie.id!),
        ),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                backgroundImage(),
                header(),
                content(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
