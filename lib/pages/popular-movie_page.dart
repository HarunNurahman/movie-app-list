import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/popular_bloc/popular_bloc.dart';
import '../configs/styles.dart';
import '../models/movie_model.dart';
import 'detail-movie_page.dart';
import 'widgets/genre_card.dart';
import 'widgets/popular_card.dart';

class PopularMoviePage extends StatelessWidget {
  const PopularMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    // AppBar Widget
    PreferredSizeWidget appBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          'Popular Movie',
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
        BlocProvider<PopularBloc>(
          create: (context) => PopularBloc()..add(PopularEventStarted(0, '')),
        ),
      ],
      child: BlocBuilder<PopularBloc, PopularState>(
        builder: (context, state) {
          if (state is PopularLoading) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: blueColor,
                ),
              ),
            );
          } else if (state is PopularSuccess) {
            String imgUrl = 'https://image.tmdb.org/t/p/original';

            List<MovieModel> popular = state.movieList;
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
                      crossAxisCount: 1,
                      // crossAxisSpacing: 8,
                      // mainAxisSpacing: 6,
                      childAspectRatio: 1.8,
                    ),
                    itemCount: popular.length = 10,
                    itemBuilder: (context, index) {
                      MovieModel popularList = popular[index];
                      return PopularCard(
                        imgUrl: '$imgUrl/${popularList.posterPath!}',
                        movieTitle: popularList.title!,
                        releaseDate: popularList.releaseDate!,
                        rating: popularList.voteAverage.toString(),
                        genreList: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GenreCard(
                              genre:
                                  'ID: ${popularList.genre![index].toString()}',
                            );
                          },
                          itemCount: popularList.genre!.length,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailMoviePage(
                                detailMovie: popularList,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            );
          }
          return Scaffold();
        },
      ),
    );
  }
}
