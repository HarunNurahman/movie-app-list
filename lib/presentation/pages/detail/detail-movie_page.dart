import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';

List<String> _tabs = ['Overview', 'Casts'];

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              buildHeader(),
              // Info section (release date, duration, genre)
              buildInfo(),
              // Tab bar
              buildTabBar(),
              // Tab bar view
              buildTabBarViewContent(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        title: const Text('Detail'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark_border_outlined, size: 24),
          ),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          // Movie banner
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            child: Image.asset('assets/images/img_banner.png'),
          ),
          // Movie poster
          Positioned(
            bottom: 15,
            left: 30,
            child: Image.asset(
              'assets/images/img_movie-1.png',
              width: 95,
              height: 120,
            ),
          ),
          // Movie title
          Positioned(
            bottom: 10,
            left: 135,
            child: Text(
              'Spiderman: No Way\nHome',
              style: whiteTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          // Movie rating
          Positioned(
            bottom: 90,
            right: 12,
            child: Container(
              width: 60,
              height: 24,
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: darkGrayColor,
              ),
              child: Row(
                children: [
                  Image.asset('assets/icons/ic_star.png', width: 16),
                  const SizedBox(width: 4),
                  Text(
                    '4.5',
                    style: whiteTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semiBold,
                      color: orangeColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInfo() {
    // Info item
    Widget buildInfoItem({String? icon, String? text}) {
      return Row(
        children: [
          Image.asset(icon!, color: lightGrayColor, width: 16),
          const SizedBox(width: 4),
          Text(
            text!,
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
              color: lightGrayColor,
            ),
          ),
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildInfoItem(
            icon: 'assets/icons/ic_year.png',
            text: '2022',
          ),
          const SizedBox(width: 16),
          buildInfoItem(
            icon: 'assets/icons/ic_duration.png',
            text: '180 min',
          ),
          const SizedBox(width: 16),
          buildInfoItem(
            icon: 'assets/icons/ic_ticket.png',
            text: 'Action',
          ),
        ],
      ),
    );
  }

  Widget buildTabBar() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        padding: const EdgeInsets.only(left: 30),
        indicatorColor: grayColor,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.only(top: 4, bottom: 4, right: 12),
        labelColor: whiteColor,
        labelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        unselectedLabelStyle: whiteTextStyle.copyWith(
          fontWeight: medium,
        ),
        tabs: _tabs.map((tabList) => Tab(text: tabList)).toList(),
      ),
    );
  }

  Widget buildTabBarView() {
    Widget buildMovieOverview(String overview) {
      return Text(
        overview,
        style: whiteTextStyle.copyWith(fontSize: 12, fontWeight: medium),
      );
    }

    Widget buildMovieCast(String imgUrl, String name) {
      return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            name,
            style: whiteTextStyle.copyWith(
              fontSize: 12,
              fontWeight: medium,
            ),
          )
        ],
      );
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
      child: TabBarView(
        children: [
          buildMovieOverview(
            'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
          ),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
              buildMovieCast('assets/images/img_movie-1.png', 'Tom Cruise'),
            ],
          )
        ],
      ),
    );
  }

  Widget buildTabBarViewContent() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 100,
        maxHeight: 500,
      ),
      child: buildTabBarView(),
    );
  }
}
