import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:movieapp_javan_devtest/configs/styles.dart';

class DetailMoviePage extends StatelessWidget {
  const DetailMoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/lotr-1.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Text(
                  'The Lords of The Rings',
                  style: whiteTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: medium,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
