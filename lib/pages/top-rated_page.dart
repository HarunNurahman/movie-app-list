import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/bloc/top-rated_bloc/top_rated_bloc.dart';
import 'package:movieapp_javan_devtest/pages/widgets/top-rated_card.dart';

import '../configs/styles.dart';
import '../models/movie_model.dart';
import 'detail-movie_page.dart';

class TopRated extends StatelessWidget {
  const TopRated({super.key});

  @override
  Widget build(BuildContext context) {
    // App bar widget
    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text(
          'Top Rated Movie',
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
        centerTitle: true,
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

    return MultiBlocProvider(
      providers: [
        BlocProvider<TopRatedBloc>(
          create: (context) =>
              TopRatedBloc()..add(const TopRatedEventStarted(0, '')),
        ),
      ],
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
            String imgUrl = 'https://image.tmdb.org/t/p/original';

            List<MovieModel> movie = state.movieList;
            return Scaffold(
              appBar: appBar(),
              drawer: drawer(),
              body: Container(
                margin: EdgeInsets.all(defaultRadius),
                child: GridView.builder(
                  padding: EdgeInsets.all(defaultRadius),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: 0.4,
                  ),
                  itemCount: movie.length = 10,
                  itemBuilder: (context, index) {
                    MovieModel movieModel = movie[index];
                    return TopRatedCard(
                      imgUrl: '$imgUrl/${movieModel.posterPath!}',
                      movieTitle: movieModel.title!,
                      releaseDate: movieModel.releaseDate!,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailMoviePage(
                              detailMovie: movieModel,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
