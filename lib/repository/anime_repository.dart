import 'package:dio/dio.dart';
import 'package:firebase_daves/model/model_anime.dart';

class AnimeRepository {
  static String baseUrl = "https://api.jikan.moe/v3/";
  static String searchUrl = "search/anime/?q=";

  static Future<List<AnimeModel>> searchAnime(String animeName) async {
    String url = baseUrl + searchUrl + animeName;

    try {
      var response = await Dio().get(url);
      List<AnimeModel> listAnimes = <AnimeModel>[];
      response.data['results'].forEach((v) {
        if (v != null) {
          listAnimes.add(AnimeModel.fromJson(v));
        }
      });
      return listAnimes;
    } catch (e) {
      throw "Erro ao buscar animes.";
    }
  }
}
