import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';

List<String> _tabs = ['Overview', 'Casts'];

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            // Header
            buildHeader(),
            // Info section (release date, duration, genre)
            buildInfo(),
            // Tab bar
            buildTabBar(),
            // Tab bar view
          ],
        ),
      ),
    );
  }

  PreferredSize buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: AppBar(
          title: const Text('Detail'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border_outlined, size: 24),
            ),
          ],
        ),
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
        indicatorColor: grayColor,
        dividerColor: Colors.transparent,
        labelPadding: const EdgeInsets.symmetric(vertical: 4),
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
}
