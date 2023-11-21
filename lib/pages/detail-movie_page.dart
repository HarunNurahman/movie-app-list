import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/detail-movie_bloc/detail_movie_bloc.dart';
import '../configs/styles.dart';
import '../models/cast_model.dart';
import '../models/detail-movie_model.dart';
import '../models/movie_model.dart';
import 'widgets/genre_card.dart';

class DetailMoviePage extends StatelessWidget {
  final MovieModel detailMovie;
  const DetailMoviePage({super.key, required this.detailMovie});

  Future<void> urlLauncher(
    String url, {
    bool forceWebView = false,
    bool enableJavaScript = false,
  }) async {
    await launchUrl(
      Uri.parse(url),
    );
  }

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original';
    String youtubeUrl = 'https://www.youtube.com/watch?v';

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
              errorListener: (errorMessage) => Container(
                width: 140,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/error-404.png',
                    ),
                  ),
                ),
              ),
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: backdropShadow(),
      );
    }

    Widget header() {
      return BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieSuccess) {
            DetailMovieModel detailMovieModel = state.detailMovie;
            return Container(
              width: double.infinity,
              margin:
                  EdgeInsets.symmetric(horizontal: defaultMargin, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: whiteColor,
                          size: 24,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child:
                            Icon(Icons.more_horiz, color: whiteColor, size: 24),
                      )
                    ],
                  ),
                  const SizedBox(height: 60),
                  Center(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final url =
                                '$youtubeUrl=${detailMovieModel.trailerId}';
                            await urlLauncher(url);
                          },
                          child: Image.asset(
                            'assets/icons/ic_play.png',
                            width: 45,
                          ),
                        ),
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
          } else {
            return const SizedBox();
          }
        },
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
                      fontSize: 24,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // Release Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Release Date',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            detailMovieModel.releaseDate!,
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
                      // Budget
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Budget',
                            style: subtitleTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppFormat.currencyFormat(
                              detailMovieModel.budget!.toString(),
                            ),
                            style: blackTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semiBold,
                            ),
                          )
                        ],
                      ),
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
                          fontSize: 18,
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
                  ),
                  const SizedBox(height: 20),
                  // Cast List
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cast',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        height: 120,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            CastModel cast = detailMovieModel.castList![index];
                            return Column(
                              children: [
                                Container(
                                  height: 72,
                                  width: 72,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        '$imgUrl/${cast.profilePath}',
                                        errorListener: (errorMessage) =>
                                            Container(
                                          width: 140,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/error-404.png',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  width: 72,
                                  child: Text(
                                    cast.name!,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: semiBold,
                                    ),
                                    maxLines: 2,
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => VerticalDivider(
                            width: 16,
                            color: transparent,
                          ),
                          itemCount: detailMovieModel.castList!.length,
                        ),
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
      child: WillPopScope(
        onWillPop: () async => true,
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
      ),
    );
  }
}
