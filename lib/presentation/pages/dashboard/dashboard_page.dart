import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_list/core/utils/style.dart';
import 'package:movie_app_list/presentation/bloc/dashboard/dashboard_bloc.dart';
import 'package:movie_app_list/presentation/pages/home/home_page.dart';

List<Widget> _bodyItems = [
  const HomePage(),
  Text('Search Page', style: whiteTextStyle),
  Text('Watchlist Page', style: whiteTextStyle),
];

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: _bodyItems[state.tabIndex],
          bottomNavigationBar: Container(
            // Add padding to bottom navigation bar
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: cyanColor),
              ),
            ),
            child: Theme(
              // Disable splash effect when clicked
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              // Bottom navigation bar
              child: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                currentIndex: state.tabIndex,
                backgroundColor: kprimaryColor,
                selectedItemColor: cyanColor,
                unselectedItemColor: grayColor,
                selectedLabelStyle: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
                unselectedLabelStyle: whiteTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
                items: [
                  // Home page
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(
                        'assets/icons/ic_home.png',
                        width: 24,
                        color: state.tabIndex == 0 ? cyanColor : grayColor,
                      ),
                    ),
                    label: 'Home',
                  ),
                  // Search page
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(
                        'assets/icons/ic_search.png',
                        width: 24,
                        color: state.tabIndex == 1 ? cyanColor : grayColor,
                      ),
                    ),
                    label: 'Search',
                  ),
                  // Watchlist page
                  BottomNavigationBarItem(
                    icon: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Image.asset(
                        'assets/icons/ic_bookmark.png',
                        width: 24,
                        color: state.tabIndex == 2 ? cyanColor : grayColor,
                      ),
                    ),
                    label: 'Watchlist',
                  ),
                ],
                onTap: (index) => BlocProvider.of<DashboardBloc>(context).add(
                  ChangeTabEvent(index),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
