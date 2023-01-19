import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';

import '../bloc/detail-movie_bloc/detail_movie_bloc.dart';

class DetailMoviePage extends StatelessWidget {
  final MovieModel detailMovie;
  const DetailMoviePage({super.key, required this.detailMovie});

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original';

    // Header widget (thumbnail, movie title)
    Widget backgroundThumbnail() {
      Widget backColor() {
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                blackColor.withOpacity(0.0),
                blackColor.withOpacity(0.7),
              ],
            ),
          ),
        );
      }

      return BlocBuilder<DetailMovieBloc, DetailMovieState>(
        builder: (context, state) {
          if (state is DetailMovieSuccess) {
            DetailMovieModel detailMovieModel = state.detailMovie;
            return Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    '$imgUrl/${detailMovieModel.posterPath}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: backColor(),
              ),
            );
          } else {
            return Center(
              child: Text(
                'Something Went Wrong!',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            );
          }
        },
      );
    }

    // Body widget (movie title, trailer box and description box)
    Widget bodyContent() {
      Widget title() {
        return BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state is DetailMovieSuccess) {
              DetailMovieModel detailMovieModel = state.detailMovie;
              return Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.17,
                ),
                child: Text(
                  detailMovieModel.title!,
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );
      }

      Widget trailerBox() {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.13,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: defaultRadius,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trailers',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: defaultRadius),
              // Trailer video player
              // YoutubePlayer(
              //   controller: youtubeController!,
              //   showVideoProgressIndicator: true,
              //   onReady: () => print('Ready'),
              //   bottomActions: [
              //     CurrentPosition(),
              //     ProgressBar(
              //       isExpanded: true,
              //       colors: ProgressBarColors(
              //         playedColor: Colors.red,
              //         handleColor: Colors.redAccent,
              //       ),
              //     )
              //   ],
              // )
            ],
          ),
        );
      }

      Widget descriptionBox() {
        return BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state is DetailMovieSuccess) {
              DetailMovieModel detailMovieModel = state.detailMovie;
              return Container(
                margin: EdgeInsets.only(top: defaultRadius),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultRadius,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: defaultRadius),
                    Text(
                      detailMovieModel.overview!,
                      style: blackTextStyle.copyWith(
                          fontSize: 12, fontWeight: light),
                      textAlign: TextAlign.justify,
                      maxLines: 5,
                      overflow: TextOverflow.clip,
                    )
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );
      }

      Widget additionalInfo() {
        return BlocBuilder<DetailMovieBloc, DetailMovieState>(
          builder: (context, state) {
            if (state is DetailMovieSuccess) {
              DetailMovieModel detailMovieModel = state.detailMovie;
              return Container(
                margin:
                    EdgeInsets.only(top: defaultRadius, bottom: defaultMargin),
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: defaultRadius,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Release Date',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: defaultRadius),
                        Text(
                          detailMovieModel.releaseDate!,
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: defaultRadius),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Budget',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: defaultRadius),
                        Text(
                          '\$USD ${detailMovieModel.budget}',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: defaultRadius),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Genres',
                          style: blackTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                        SizedBox(height: defaultRadius),
                        Text(
                          'Adventure, Fantasy, Action',
                          style: blackTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: light,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return SizedBox();
            }
          },
        );
      }

      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            title(),
            trailerBox(),
            descriptionBox(),
            additionalInfo(),
          ],
        ),
      );
    }

    return BlocProvider(
      create: (context) => DetailMovieBloc(detailMovie.id!)
        ..add(
          DetailMovieEventStarted(detailMovie.id!),
        ),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                backgroundThumbnail(),
                bodyContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
