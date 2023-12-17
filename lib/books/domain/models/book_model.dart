class BooksModel {
  String? title;
  String? pictureUrl;
  String? myanimelistUrl;
  int? myanimelistId;
  int? rank;
  double? score;
  String? type;
  String? airedOn;
  int? members;

  BooksModel(
      {this.title,
      this.pictureUrl,
      this.myanimelistUrl,
      this.myanimelistId,
      this.rank,
      this.score,
      this.type,
      this.airedOn,
      this.members});

  BooksModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pictureUrl = json['picture_url'];
    myanimelistUrl = json['myanimelist_url'];
    myanimelistId = json['myanimelist_id'];
    rank = json['rank'];
    score = json['score'];
    type = json['type'];
    airedOn = json['aired_on'];
    members = json['members'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['picture_url'] = this.pictureUrl;
    data['myanimelist_url'] = this.myanimelistUrl;
    data['myanimelist_id'] = this.myanimelistId;
    data['rank'] = this.rank;
    data['score'] = this.score;
    data['type'] = this.type;
    data['aired_on'] = this.airedOn;
    data['members'] = this.members;
    return data;
  }
}