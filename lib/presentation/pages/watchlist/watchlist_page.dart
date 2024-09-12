import 'package:flutter/material.dart';
import 'package:movie_app_list/presentation/widgets/result_item.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: const [
          // Result item
          ResultItem(
            imgUrl: 'assets/images/img_movie-1.png',
            movieTitle: 'Spiderman',
            rating: '4.5',
            genre: 'Action',
            releaseDate: '2022',
            duration: '180 min',
          ),
          // Empty state
        ],
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Watchlist'),
        ),
      ),
    );
  }
}
