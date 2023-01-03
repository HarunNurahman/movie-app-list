import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/pages/widgets/now-playing_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/popular_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/search_delegate.dart';
import 'package:movieapp_javan_devtest/pages/widgets/top-rated_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/upcoming_card.dart';
import 'package:movieapp_javan_devtest/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);

    // App bar widget
    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text(
          'Home',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: Icon(Icons.search, color: whiteColor),
          ),
        ],
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
              onTap: () => Navigator.of(context).pushNamed('/dashboard'),
              leading: Icon(Icons.home, color: blackColor),
              title: Text('Home', style: blackTextStyle),
            ),
            // Now Playing Button
            ListTile(
              onTap: () {},
              leading: Icon(Icons.play_circle, color: blackColor),
              title: Text('Now Playing', style: blackTextStyle),
            ),
            // Top Rated Movie Button
            ListTile(
              onTap: () {},
              leading: Icon(Icons.auto_graph, color: blackColor),
              title: Text('Top Rated', style: blackTextStyle),
            ),
            // Upcoming Movie Button
            ListTile(
              onTap: () {},
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
        margin: EdgeInsets.symmetric(
          vertical: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Now playing header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Now Playing',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('nowplaying');
                  },
                  child: Text(
                    'More',
                    style: grayTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: movieProvider.nowPlaying
                      .map((movie) => NowPlayingCard(movie))
                      .toList()),
            ),
          ],
        ),
      );
    }

    // Top rated movie widget (movie title, 'more' button, top rated movie card)
    Widget topRatedBox() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: Column(
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
                  onTap: () {
                    print('top rated movie');
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: movieProvider.topRated
                    .map((movie) => TopRatedCard(movie))
                    .toList(),
              ),
            ),
          ],
        ),
      );
    }

    // Popular movie widget (movie title, 'more' button, popular movie card)
    Widget popularMovieBox() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Popular movie header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Movie',
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    print('popular movie');
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  PopularCard(),
                  PopularCard(),
                  PopularCard(),
                  PopularCard(),
                ],
              ),
            )
          ],
        ),
      );
    }

    // Upcoming movie widget (movie title, 'more' button, upcoming movie card)
    Widget upcomingMovieBox() {
      return Container(
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: Column(
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  UpcomingCard(),
                  UpcomingCard(),
                  UpcomingCard(),
                  UpcomingCard(),
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      drawer: drawer(),
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              nowPlayingBox(),
              topRatedBox(),
              popularMovieBox(),
              upcomingMovieBox(),
            ],
          ),
        ),
      ),
    );
  }
}
