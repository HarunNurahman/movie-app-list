import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:movie_app_list/core/utils/img_url.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/models/movie_model.dart';
import 'package:movie_app_list/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie_app_list/presentation/bloc/top_rated/top_rated_bloc.dart';
import 'package:movie_app_list/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie_app_list/presentation/pages/detail/detail-movie_page.dart';
import 'package:movie_app_list/presentation/widgets/custom_search-bar.dart';
import 'package:movie_app_list/presentation/widgets/top-movie_item.dart';

List<String> _tabs = ['Now Playing', 'Upcoming', 'Top Rated'];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            children: [
              // Header text
              Text(
                'What do you want to watch?',
                style: whiteTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              // Search bar
              buildSearchBar(),
              // Top 5 movies
              buildTopMovies(context),
              // Movie tabList
              buildMovieTabBar(),
              // Movie list
              buildTabBarViewContent(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return const CustomSearchBar();
  }

  Widget buildTopMovies(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TopMovieItem(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailMoviePage())),
              imgUrl: 'assets/images/img_movie-1.png',
              imgNumber: '1',
            ),
            TopMovieItem(
              imgUrl: 'assets/images/img_movie-2.png',
              imgNumber: '2',
            ),
            TopMovieItem(
              imgUrl: 'assets/images/img_movie-3.png',
              imgNumber: '3',
            ),
            TopMovieItem(
              imgUrl: 'assets/images/img_movie-4.png',
              imgNumber: '4',
            ),
            TopMovieItem(
              imgUrl: 'assets/images/img_movie-5.png',
              imgNumber: '5',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMovieTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        indicatorColor: grayColor,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.only(top: 4, bottom: 4, right: 12),
        labelColor: whiteColor,
        labelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        unselectedLabelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        tabs: _tabs.map((tabList) => Tab(text: tabList)).toList(),
      ),
    );
  }

  Widget buildTabBarViewContent(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 150,
        maxHeight: MediaQuery.of(context).size.height * 0.65,
      ),
      child: buildTabBarView(context),
    );
  }

  Widget buildTabBarView(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TabBarView(
        children: [
          // Now playing
          BlocBuilder<NowPlaying, NowPlayingState>(
            builder: (context, state) {
              if (state is NowPlayingLoading) {
                return Center(
                  child: CircularProgressIndicator(color: whiteColor),
                );
              }

              if (state is NowPlayingLoaded) {
                List<MovieModel> movieList = state.movies;
                return MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movieList.length = 9,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: imgUrl + movieList[index].posterPath!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 100,
                      ),
                    );
                  },
                );
              }

              if (state is NowPlayingFailed) {
                return Center(child: Text(state.errorMessage));
              }

              return Container();
            },
          ),

          // Upcoming
          BlocBuilder<UpcomingBloc, UpcomingState>(
            builder: (context, state) {
              if (state is UpcomingLoading) {
                return Center(
                  child: CircularProgressIndicator(color: whiteColor),
                );
              }

              if (state is UpcomingLoaded) {
                List<MovieModel> movieList = state.movies;
                return MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movieList.length = 9,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: imgUrl + movieList[index].posterPath!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 100,
                      ),
                    );
                  },
                );
              }

              if (state is UpcomingFailed) {
                return Center(child: Text(state.errorMessage));
              }
              return Container();
            },
          ),
          
          // Top rated
          BlocBuilder<TopRatedBloc, TopRatedState>(
            builder: (context, state) {
              if (state is TopRatedLoading) {
                return Center(
                  child: CircularProgressIndicator(color: whiteColor),
                );
              }

              if (state is TopRatedLoaded) {
                List<MovieModel> movieList = state.movies;
                return MasonryGridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movieList.length = 9,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: imgUrl + movieList[index].posterPath!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 100,
                      ),
                    );
                  },
                );
              }

              if (state is TopRatedFailed) {
                return Center(child: Text(state.errorMessage));
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
