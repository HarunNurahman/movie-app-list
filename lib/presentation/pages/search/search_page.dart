import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/presentation/widgets/custom_search-bar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          // Search bar
          buildSearchBar(),
          // Search result
          // const SearchResultItem(
          //   imgUrl: 'assets/images/img_movie-1.png',
          //   movieTitle: 'Spiderman',
          //   rating: '4.5',
          //   genre: 'Action',
          //   releaseDate: '2022',
          //   duration: '180 min',
          // ),
          // Error state
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/img_error_state.png', width: 76),
                const SizedBox(height: 16),
                Text(
                  'We Are Sorry, We Can\'t Find This Movie',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: semiBold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Find your movie by type title, categories, years, etc ...',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    color: grayColor,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearchBar() {
    return const CustomSearchBar();
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Search'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline_rounded, size: 20),
          ),
        ],
      ),
    );
  }
}
