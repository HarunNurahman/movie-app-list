# Movie List Application

This is a movie list application built with Dart / Flutter and uses TMDB API to get the data. 

UI Design https://www.figma.com/community/file/1054431643740926668 by [Syahidina Alif](https://www.figma.com/@syahidinaalif)

## Installation

Go to ```lib/services/api_service.dart``` and change ```apiKey``` to your own API after registered to TMDB
```
final String apiKey = 'YOUR_TMDB_API_KEY';
```

# Demo App
https://user-images.githubusercontent.com/16952129/215656313-6b899702-ad29-4fc6-85d6-150d470df2a7.mp4

## Features

- Now Playing Movie
- Popular Movie
- Search Movie
- Detail Movie w/ URL Launcher to Youtube

## Dependencies
This app using a few dependencies such as:
- [`bloc`](https://pub.dev/packages/bloc) - A predictable state management library that helps implement the BLoC (Business Logic Component) design pattern.
- [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern.
- [`google_fonts`](https://pub.dev/packages/google_fonts) - Google Fonts package.
- [`youtube_player_flutter`](https://pub.dev/packages/youtube_player_flutter) - Flutter plugin for playing or streaming inline YouTube videos using the official iFrame player API.
- [`equatable`](https://pub.dev/packages/equatable) - A Dart package that helps to implement value based equality without needing to explicitly override == and hashCode.
- [`cached_network_image`](https://pub.dev/packages/cached_network_image) - Flutter library to load and cache network images. Can also be used with placeholder and error widgets.
