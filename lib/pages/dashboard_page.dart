import 'package:flutter/material.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // App bar widget
    PreferredSizeWidget appBar() {
      return AppBar(
        title: Text(
          'Home',
          style: whiteTextStyle.copyWith(
            fontSize: 18,
            fontWeight: medium,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
            icon: Icon(Icons.search, color: whiteColor),
          ),
        ],
      );
    }

    // Drawer widget
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
              onTap: () => Navigator.of(context).pushNamed('/dashboard'),
              leading: Icon(Icons.home, color: blackColor),
              title: Text('Home', style: blackTextStyle),
            ),
            // Now Playing Button
            ListTile(
              onTap: () {},
              leading: Icon(Icons.play_circle, color: blackColor),
              title: Text('Now Playing', style: blackTextStyle),
            ),
            // Top Rated Movie Button
            ListTile(
              onTap: () {},
              leading: Icon(Icons.auto_graph, color: blackColor),
              title: Text('Top Rated', style: blackTextStyle),
            ),
            // Upcoming Movie Button
            ListTile(
              onTap: () {},
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

    return Scaffold(
      drawer: drawer(),
      appBar: appBar(),
      body: Center(
        child: Text('Dashboard Page', style: blackTextStyle),
      ),
    );
  }
}

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
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
