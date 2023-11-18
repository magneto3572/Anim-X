class FeaturedMangaModel {
  int? currentPage;
  bool? hasNextPage;
  List<FeatureMangaItem>? results;

  FeaturedMangaModel({this.currentPage, this.hasNextPage, this.results});

  FeaturedMangaModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    hasNextPage = json['hasNextPage'];
    if (json['results'] != null) {
      results = <FeatureMangaItem>[];
      json['results'].forEach((v) {
        results!.add(FeatureMangaItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['hasNextPage'] = hasNextPage;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FeatureMangaItem {
  String? id;
  String? episodeId;
  int? episodeNumber;
  String? title;
  String? image;
  String? url;

  FeatureMangaItem(
      {this.id,
      this.episodeId,
      this.episodeNumber,
      this.title,
      this.image,
      this.url});

  FeatureMangaItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    episodeId = json['episodeId'];
    episodeNumber = json['episodeNumber'];
    title = json['title'];
    image = json['image'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['episodeId'] = episodeId;
    data['episodeNumber'] = episodeNumber;
    data['title'] = title;
    data['image'] = image;
    data['url'] = url;
    return data;
  }
}