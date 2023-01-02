import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({super.key});

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  String youtubeUrl = 'https://www.youtube.com/watch?v=V75dMMIW2B4';

  YoutubePlayerController? youtubeController;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl)!,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
        forceHD: true,
        showLiveFullscreenButton: true,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/lotr-1.jpg'),
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
            'The Lords of The Rings: The Fellowship of The Rings',
            style: whiteTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      }

      Widget body() {
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
              // Trailer video player
              Container(
                margin: EdgeInsets.only(top: defaultRadius),
                child: YoutubePlayer(
                  controller: youtubeController!,
                  showVideoProgressIndicator: true,
                ),
              )
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
            body(),
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
        }
    );
  }
}
