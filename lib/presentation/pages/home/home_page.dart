import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_list/core/utils/img_url.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/models/movie_model.dart';
import 'package:movie_app_list/presentation/bloc/movie/movie_bloc.dart';
import 'package:movie_app_list/presentation/pages/detail/detail-movie_page.dart';
import 'package:movie_app_list/presentation/widgets/custom_search-bar.dart';
import 'package:movie_app_list/presentation/widgets/movie-list_item.dart';
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
        maxHeight: MediaQuery.of(context).size.height * 0.75,
      ),
      child: buildTabBarView(context),
    );
  }

  Widget buildTabBarView(BuildContext context) {
    return TabBarView(
      children: [
        BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieLoaded) {
              List<MovieModel> movieList = state.movies;
              return Container(
                margin: const EdgeInsets.only(top: 24),
                child: Wrap(
                  runSpacing: 15,
                  spacing: 15,
                  children: movieList
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: CachedNetworkImage(
                            imageUrl: imgUrl + e.posterPath!,
                            height: 150,
                            width: 100,
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            }

            if (state is MovieFailed) {
              return Center(
                child: Text(state.errorMessage, style: whiteTextStyle),
              );
            }

            return Container();
          },
        ),
        Center(child: Text('Upcoming', style: whiteTextStyle)),
        Center(child: Text('Top Rated', style: whiteTextStyle)),
      ],
    );
  }
}
