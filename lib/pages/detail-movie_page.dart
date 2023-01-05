import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:movieapp_javan_devtest/models/movie_model.dart';
import 'package:movieapp_javan_devtest/providers/movie_provider.dart';
import 'package:provider/provider.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMoviePage extends StatefulWidget {
  final MovieModel detailMovie;
  const DetailMoviePage(this.detailMovie, {super.key});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  String youtubeUrl = 'V75dMMIW2B4';

  YoutubePlayerController? youtubeController;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        forceHD: true,
        controlsVisibleAtStart: true,
        hideThumbnail: true,
        showLiveFullscreenButton: true,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MovieProvider movieProvider = Provider.of<MovieProvider>(context);
    String imgUrl = 'https://image.tmdb.org/t/p/original/';
    print(widget.detailMovie.overview);

    // Header widget (thumbnail, movie title)
    Widget backgroundThumbnail() {
      Widget backColor() {
        return Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                blackColor.withOpacity(0.0),
                blackColor.withOpacity(0.7),
              ],
            ),
          ),
        );
      }

      return Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              '$imgUrl/${widget.detailMovie.posterPath}',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: backColor(),
        ),
      );
    }

    // Body widget (movie title, trailer box and description box)
    Widget bodyContent() {
      Widget title() {
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.17,
          ),
          child: Text(
            widget.detailMovie.title!,
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }

      Widget trailerBox() {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.13,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: defaultRadius,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trailers',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: defaultRadius),
              // Trailer video player
              YoutubePlayer(
                controller: youtubeController!,
                showVideoProgressIndicator: true,
                onReady: () => print('Ready'),
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(
                    isExpanded: true,
                    colors: ProgressBarColors(
                      playedColor: Colors.red,
                      handleColor: Colors.redAccent,
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }

      Widget descriptionBox() {
        return Container(
          margin: EdgeInsets.only(top: defaultRadius),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultRadius,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              SizedBox(height: defaultRadius),
              Text(
                widget.detailMovie.title!,
                style: blackTextStyle.copyWith(fontSize: 12, fontWeight: light),
                textAlign: TextAlign.justify,
                maxLines: 5,
                overflow: TextOverflow.clip,
              )
            ],
          ),
        );
      }

      Widget additionalInfo() {
        return Container(
          margin: EdgeInsets.only(top: defaultRadius, bottom: defaultMargin),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: defaultRadius,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Release Date',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: defaultRadius),
                  Text(
                    widget.detailMovie.overview!,
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
              SizedBox(height: defaultRadius),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Budget',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: defaultRadius),
                  Text(
                    '\$40000000',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
              SizedBox(height: defaultRadius),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Genres',
                    style: blackTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(height: defaultRadius),
                  Text(
                    'Adventure, Fantasy, Action',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      }

      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            title(),
            trailerBox(),
            descriptionBox(),
            additionalInfo(),
          ],
        ),
      );
    }

    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: youtubeController!,
        ),
        builder: (context, player) {
          return Scaffold(
            backgroundColor: Colors.grey[200],
            body: SafeArea(
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    backgroundThumbnail(),
                    bodyContent(),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
