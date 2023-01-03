import 'package:flutter/cupertino.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/top-rated_model.dart';

class TopRatedCard extends StatelessWidget {
  final TopRatedModel topRated;

  const TopRatedCard(this.topRated, {super.key});

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://image.tmdb.org/t/p/original/';
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 16, right: 16),
        width: 120,
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
                '$imgUrl/${topRated.posterPath}',
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
                    topRated.title!,
                    style: blackTextStyle.copyWith(fontWeight: medium),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  // Release date
                  Text(
                    topRated.releaseDate!,
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
