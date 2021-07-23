import 'package:firebase_daves/model/model_anime.dart';
import 'package:firebase_daves/repository/anime_repository.dart';

class AnimeController {
  Future<List<AnimeModel>> loadAnimes(String animeName) async {
    List<AnimeModel> response = await AnimeRepository.searchAnime(animeName);
    return response;
  }
}
