import 'package:flutter/material.dart';
import 'package:movie_app_list/core/utils/style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: TextFormField(
        style: whiteTextStyle,
        cursorColor: whiteColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: darkGrayColor,
          hintText: 'Search',
          hintStyle: whiteTextStyle.copyWith(color: grayColor),
          suffixIcon: Icon(Icons.search, color: grayColor, size: 24),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
