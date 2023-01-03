// // API key
// import 'dart:convert';

// import 'package:movieapp_javan_devtest/models/now-playing_model.dart';
// import 'package:http/http.dart' as http;

// const apiKey = '1f8a6fdb1a03d4b7a9d53856cec57c42';

// class NowPlayingService {
//   // API url
//   String baseUrl = 'https://api.themoviedb.org/3/movie/';

//   Future<List<NowPlayingModel>> getNowPlaying() async {
//     var url = '$baseUrl/now_playing?api_key=$apiKey&language=en-ID';
//     var response = await http.get(Uri.parse(url));
//     print(response.body);

//     if (response.statusCode == 200) {
//       List data = jsonDecode(response.body)['results'];
//       List<NowPlayingModel> nowPlaying = [];

//       for (var item in data) {
//         nowPlaying.add(NowPlayingModel.fromJson(item));
//       }
//       return nowPlaying;
//     } else {
//       throw Exception('Gagal Mengambil Data');
//     }
//   }
// }
