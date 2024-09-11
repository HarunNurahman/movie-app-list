import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/presentation/widgets/top-movie_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              searchBar(),
              // Top 5 movies
              topMovies(),
              // Movie tabList
              movieTabBar(),
              // Movie list
              ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 150,
                  maxHeight: 350,
                ),
                child: movieList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TextFormField(
        style: whiteTextStyle,
        cursorColor: whiteColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: darkGrayColor,
          hintText: 'Search',
          hintStyle: whiteTextStyle.copyWith(color: grayColor),
          suffixIcon: Icon(Icons.search, color: grayColor, size: 24),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget topMovies() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TopMovieItem(
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

  Widget movieTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TabBar(
        indicatorColor: grayColor,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.symmetric(vertical: 4),
        labelColor: whiteColor,
        labelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        unselectedLabelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        tabs: const [
          Tab(child: Text('Now Playing')),
          Tab(child: Text('Upcoming')),
          Tab(child: Text('Top Rated')),
        ],
      ),
    );
  }

  Widget movieList(BuildContext context) {
    return TabBarView(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 24),
          child: Wrap(
            spacing: 13,
            runSpacing: 18,
            children: [
              Image.asset('assets/images/img_movie-1.png', width: 100),
              Image.asset('assets/images/img_movie-1.png', width: 100),
              Image.asset('assets/images/img_movie-1.png', width: 100),
              Image.asset('assets/images/img_movie-1.png', width: 100),
              Image.asset('assets/images/img_movie-1.png', width: 100),
              Image.asset('assets/images/img_movie-1.png', width: 100),
            ],
          ),
        ),
        Center(child: Text('Upcoming', style: whiteTextStyle)),
        Center(child: Text('Top Rated', style: whiteTextStyle)),
      ],
    );
  }
}
