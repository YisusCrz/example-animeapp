import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:anime2_app/src/models/anime_model.dart';

class AnimeProvider{

  Future<List<Anime>> getAnimes( int page1, int page2 ) async {
    
    final resp = await http.get( 'https://api.jikan.moe/v3/genre/anime/$page1/$page2' );

    final data = json.decode(resp.body);

    final animes = new Animes.fromJsonList(data['anime']);

    return animes.items;

  }
}

final animeProvider = new AnimeProvider();