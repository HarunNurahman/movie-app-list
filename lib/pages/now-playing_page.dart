import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/pages/detail-movie_page.dart';
import 'package:movieapp_javan_devtest/pages/widgets/now-playing_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/movie_bloc/movie_bloc.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    // App bar widget
    PreferredSizeWidget appBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          'Now Playing',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: blueColor),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc()..add(const MovieEventStarted(0, '')),
        ),
      ],
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: grayColor,
                ),
              ),
            );
          } else if (state is MovieSuccess) {
            String imgUrl = 'https://image.tmdb.org/t/p/original';

            List<MovieModel> movie = state.movieList;
            return WillPopScope(
              onWillPop: () async => true,
              child: Scaffold(
                appBar: appBar(),
                body: Container(
                  margin: EdgeInsets.all(defaultRadius),
                  child: GridView.builder(
                    padding: EdgeInsets.all(defaultRadius),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      // mainAxisSpacing: 6,
                      childAspectRatio: 0.45,
                    ),
                    itemCount: movie.length = 10,
                    itemBuilder: (context, index) {
                      MovieModel movieModel = movie[index];
                      return NowPlayingCard(
                        imgUrl: '$imgUrl/${movieModel.posterPath!}',
                        movieTitle: movieModel.title!,
                        // releaseDate: movieModel.releaseDate!,
                        rating: movieModel.voteAverage.toString(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailMoviePage(detailMovie: movieModel),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
