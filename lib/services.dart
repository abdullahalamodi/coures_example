import 'dart:convert';
import 'dart:developer';

import 'package:coures_example/anime_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final servicesProvider = Provider<Services>((ref) {
  return Services();
});

class Services {
  Future<AnimeModel?> getAnimeList() async {
    final uri = Uri(
      scheme: "https",
      host: "api.jikan.moe",
      path: "/v4/top/anime",
      queryParameters: {
        "page": '1',
        "limit": '25',
        "type": "manga",
      },
    );
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final animeModel = AnimeModel.fromJson(data);
        return animeModel;
      }
      log(response.toString());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return null;
  }
}
