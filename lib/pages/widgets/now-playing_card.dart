import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
import 'package:movieapp_javan_devtest/pages/detail-movie_page.dart';

class NowPlayingCard extends StatelessWidget {
  final NowPlayingModel nowPlaying;

  const NowPlayingCard(this.nowPlaying, {super.key});

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original/';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMoviePage(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 16),
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          border: Border.all(
            color: grayColor,
            width: 0.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Movie poster
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadius),
              child: Image.network(
                '$imgUrl/${nowPlaying.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Movie title
                  Text(
                    nowPlaying.title!,
                    style: blackTextStyle.copyWith(fontWeight: medium),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Release date
                  Text(
                    nowPlaying.releaseDate!,
                    style: grayTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
