import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/pages/widgets/now-playing_card.dart';
import 'package:movieapp_javan_devtest/pages/widgets/search-result_card.dart';

import '../../bloc/search_bloc/search_bloc.dart';
import '../../configs/styles.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back),
      );

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.close),
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBloc()
        ..add(
          SearchsEventStarted(query),
        ),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoading) {
            return Center(
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: grayColor,
                ),
              ),
            );
          } else if (state is SearchSuccess) {
            String imgUrl = 'https://image.tmdb.org/t/p/original';
            List<MovieModel> search = state.searchResult;
            return ListView.builder(
              itemCount: search.length,
              itemBuilder: (context, index) {
                return SearchResultCard(
                  imgUrl: '$imgUrl/${search[index].posterPath}',
                  movieTitle: search[index].title!,
                  rating: search[index].voteAverage.toString(),
                  onTap: () {},
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
