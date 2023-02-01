import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/bloc/movie_bloc/movie_bloc.dart';
import 'package:movieapp_javan_devtest/bloc/search_bloc/search_bloc.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/detail-movie_model.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/pages/widgets/now-playing_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/popular_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/search_delegate.dart';
import 'package:movieapp_javan_devtest/pages/widgets/top-rated_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/upcoming_card.dart';

import '../bloc/popular_bloc/popular_bloc.dart';
import '../bloc/top-rated_bloc/top_rated_bloc.dart';
import '../bloc/upcoming_bloc/upcoming_bloc.dart';
import 'detail-movie_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original';

    // App bar widget
    PreferredSizeWidget appBar() {
      return AppBar(
        elevation: 0,
        backgroundColor: transparent,
        title: Text(
          'Movie App List',
          style: primaryTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: Icon(Icons.search, color: blueColor),
          ),
        ],
        automaticallyImplyLeading: false,
      );
    }

    // Drawer widget (drawer header, menu item)
    Widget drawer() {
      return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: whiteColor,
                    child: const CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(
                        'assets/images/img_profile.JPG',
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Harun Nurahman',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ),
            // Home Button
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('/'),
              leading: Icon(Icons.home, color: blackColor),
              title: Text('Home', style: blackTextStyle),
            ),
            // Now Playing Button
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('/now-playing'),
              leading: Icon(Icons.play_circle, color: blackColor),
              title: Text('Now Playing', style: blackTextStyle),
            ),
            // Top Rated Movie Button
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('/top-rated'),
              leading: Icon(Icons.auto_graph, color: blackColor),
              title: Text('Top Rated', style: blackTextStyle),
            ),
            // Upcoming Movie Button
            ListTile(
              onTap: () => Navigator.of(context).pushNamed('/upcoming'),
              leading: Icon(Icons.live_tv, color: blackColor),
              title: Text('Upcoming Movies', style: blackTextStyle),
            ),
            const Divider(thickness: 1),
            // About Button
            ListTile(
              onTap: () {},
              leading: Icon(Icons.help, color: blackColor),
              title: Text('About', style: blackTextStyle),
            )
          ],
        ),
      );
    }

    // Now playing movie widget (movie title, 'more' button, now playing card)
    Widget nowPlayingBox() {
      return Container(
        margin: EdgeInsets.only(top: 16, bottom: defaultMargin),
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: blueColor,
                  ),
                ),
              );
            } else if (state is MovieSuccess) {
              List<MovieModel> movie = state.movieList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Now playing header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Now Showing',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/now-playing',
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: transparent,
                            border: Border.all(color: gray3Color, width: 1),
                            borderRadius: BorderRadius.circular(defaultMargin),
                          ),
                          child: Text(
                            'See More',
                            style: grayTextStyle.copyWith(
                              color: gray2Color,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height / 1.75,
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieModel nowPlayingList = movie[index];
                        return NowPlayingCard(
                          imgUrl: '$imgUrl/${nowPlayingList.posterPath}',
                          movieTitle: nowPlayingList.title!,
                          rating: nowPlayingList.voteAverage.toString(),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailMoviePage(detailMovie: nowPlayingList),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => VerticalDivider(
                        color: transparent,
                        width: 16,
                      ),
                      itemCount: movie.length = 7,
                    ),
                  )
                ],
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
        ),
      );
    }

    // Top rated movie widget (movie title, 'more' button, top rated movie card)
    Widget topRatedBox() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: BlocBuilder<TopRatedBloc, TopRatedState>(
          builder: (context, state) {
            if (state is TopRatedLoading) {
              return Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: grayColor,
                  ),
                ),
              );
            } else if (state is TopRatedSuccess) {
              List<MovieModel> movie = state.movieList;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top rated movie header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top Rated Movie',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/top-rated'),
                        child: Text(
                          'More',
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.15,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieModel topRatedList = movie[index];
                        return TopRatedCard(
                          imgUrl: '$imgUrl${topRatedList.posterPath}',
                          movieTitle: topRatedList.title!,
                          releaseDate: topRatedList.releaseDate!,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailMoviePage(detailMovie: topRatedList),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => VerticalDivider(
                        color: transparent,
                        width: 8,
                      ),
                      itemCount: movie.length = 7,
                    ),
                  )
                ],
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
        ),
      );
    }

    // Popular movie widget (movie title, 'more' button, popular movie card)
    Widget popularMovieBox() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: BlocBuilder<PopularBloc, PopularState>(
          builder: (context, state) {
            if (state is PopularLoading) {
              return Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: grayColor,
                  ),
                ),
              );
            } else if (state is PopularSuccess) {
              List<MovieModel> movie = state.movieList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Popular movie header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Movie',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/popular'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: transparent,
                            border: Border.all(color: gray3Color, width: 1),
                            borderRadius: BorderRadius.circular(defaultMargin),
                          ),
                          child: Text(
                            'See More',
                            style: grayTextStyle.copyWith(
                              color: gray2Color,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 300,
                    child: Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          MovieModel popularList = movie[index];
                          return PopularCard(
                            
                            imgUrl: '$imgUrl/${popularList.posterPath}',
                            movieTitle: popularList.title!,
                            rating: popularList.voteAverage.toString(),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailMoviePage(
                                  detailMovie: popularList,
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => VerticalDivider(
                          width: 16,
                          color: transparent,
                        ),
                        itemCount: movie.length = 7,
                      ),
                    ),
                  )
                ],
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
        ),
      );
    }

    // Upcoming movie widget (movie title, 'more' button, upcoming movie card)
    Widget upcomingMovieBox() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: BlocBuilder<UpcomingBloc, UpcomingState>(
          builder: (context, state) {
            if (state is UpcomingLoading) {
              return Center(
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    color: grayColor,
                  ),
                ),
              );
            } else if (state is UpcomingSuccess) {
              List<MovieModel> movie = state.movieList;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // upcoming movie header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Movie',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('upcoming movie');
                        },
                        child: Text(
                          'More',
                          style: grayTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2.15,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        MovieModel upcomingList = movie[index];
                        return UpcomingCard(
                          imgUrl: '$imgUrl/${upcomingList.posterPath}',
                          movieTitle: upcomingList.title!,
                          releaseDate: upcomingList.releaseDate!,
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailMoviePage(detailMovie: upcomingList),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => VerticalDivider(
                        color: transparent,
                        width: 6,
                      ),
                      itemCount: movie.length = 5,
                    ),
                  )
                ],
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
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (context) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
        BlocProvider<TopRatedBloc>(
          create: (context) => TopRatedBloc()..add(TopRatedEventStarted(1, '')),
        ),
        BlocProvider(
          create: (context) => PopularBloc()..add(PopularEventStarted(2, '')),
        ),
        BlocProvider(
          create: (context) => UpcomingBloc()..add(UpcomingEventStarted(3, '')),
        ),
        BlocProvider(
          create: (context) => SearchBloc()..add(SearchsEventStarted('')),
        ),
      ],
      child: Scaffold(
        // drawer: drawer(),
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                nowPlayingBox(),
                // topRatedBox(),
                popularMovieBox(),
                // upcomingMovieBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
