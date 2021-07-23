class AnimeModel {
  int? malId;
  String? url;
  String? imageUrl;
  String? title;
  bool? airing;
  String? synopsis;
  String? type;
  int? episodes;
  double? score;
  String? startDate;
  String? endDate;
  int? members;
  String? rated;

  AnimeModel(
      {this.malId,
      this.url,
      this.imageUrl,
      this.title,
      this.airing,
      this.synopsis,
      this.type,
      this.episodes,
      this.score,
      this.startDate,
      this.endDate,
      this.members,
      this.rated});

  AnimeModel.fromJson(Map<String, dynamic> json) {
    malId = json['mal_id'];
    url = json['url'];
    imageUrl = json['image_url'];
    title = json['title'];
    airing = json['airing'];
    synopsis = json['synopsis'];
    type = json['type'];
    episodes = json['episodes'];
    score = json['score'].toDouble();
    json['start_date'] == null
        ? startDate = "AndamentoT"
        : startDate = json['start_date'];
    json['end_date'] == null ? endDate = "AndamentoT" : endDate = json['end_date'];
    members = json['members'];
    rated = json['rated'];
  }
}
