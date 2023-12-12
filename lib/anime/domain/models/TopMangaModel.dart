class TopMangaModel {
  final Pagination? pagination;
  final List<MangaData>? data;

  TopMangaModel({
    this.pagination,
    this.data,
  });

  TopMangaModel.fromJson(Map<String, dynamic> json)
    : pagination = (json['pagination'] as Map<String,dynamic>?) != null ? Pagination.fromJson(json['pagination'] as Map<String,dynamic>) : null,
      data = (json['data'] as List?)?.map((dynamic e) => MangaData.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'pagination' : pagination?.toJson(),
    'data' : data?.map((e) => e.toJson()).toList()
  };
}

class Pagination {
  final int? lastVisiblePage;
  final bool? hasNextPage;
  final int? currentPage;
  final Items? items;

  Pagination({
    this.lastVisiblePage,
    this.hasNextPage,
    this.currentPage,
    this.items,
  });

  Pagination.fromJson(Map<String, dynamic> json)
    : lastVisiblePage = json['last_visible_page'] as int?,
      hasNextPage = json['has_next_page'] as bool?,
      currentPage = json['current_page'] as int?,
      items = (json['items'] as Map<String,dynamic>?) != null ? Items.fromJson(json['items'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'last_visible_page' : lastVisiblePage,
    'has_next_page' : hasNextPage,
    'current_page' : currentPage,
    'items' : items?.toJson()
  };
}

class Items {
  final int? count;
  final int? total;
  final int? perPage;

  Items({
    this.count,
    this.total,
    this.perPage,
  });

  Items.fromJson(Map<String, dynamic> json)
    : count = json['count'] as int?,
      total = json['total'] as int?,
      perPage = json['per_page'] as int?;

  Map<String, dynamic> toJson() => {
    'count' : count,
    'total' : total,
    'per_page' : perPage
  };
}

class MangaData {
  final int? malId;
  final String? url;
  final Images? images;
  final bool? approved;
  final List<Titles>? titles;
  final String? title;
  final String? titleEnglish;
  final String? titleJapanese;
  final List<String>? titleSynonyms;
  final String? type;
  final dynamic chapters;
  final dynamic volumes;
  final String? status;
  final bool? publishing;
  final Published? published;
  final double? score;
  final double? scored;
  final int? scoredBy;
  final int? rank;
  final int? popularity;
  final int? members;
  final int? favorites;
  final String? synopsis;
  final String? background;
  final List<Authors>? authors;
  final List<Serializations>? serializations;
  final List<Genres>? genres;
  final List<dynamic>? explicitGenres;
  final List<Themes>? themes;
  final List<Demographics>? demographics;

  MangaData({
    this.malId,
    this.url,
    this.images,
    this.approved,
    this.titles,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.chapters,
    this.volumes,
    this.status,
    this.publishing,
    this.published,
    this.score,
    this.scored,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.authors,
    this.serializations,
    this.genres,
    this.explicitGenres,
    this.themes,
    this.demographics,
  });

  MangaData.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      url = json['url'] as String?,
      images = (json['images'] as Map<String,dynamic>?) != null ? Images.fromJson(json['images'] as Map<String,dynamic>) : null,
      approved = json['approved'] as bool?,
      titles = (json['titles'] as List?)?.map((dynamic e) => Titles.fromJson(e as Map<String,dynamic>)).toList(),
      title = json['title'] as String?,
      titleEnglish = json['title_english'] as String?,
      titleJapanese = json['title_japanese'] as String?,
      titleSynonyms = (json['title_synonyms'] as List?)?.map((dynamic e) => e as String).toList(),
      type = json['type'] as String?,
      chapters = json['chapters'],
      volumes = json['volumes'],
      status = json['status'] as String?,
      publishing = json['publishing'] as bool?,
      published = (json['published'] as Map<String,dynamic>?) != null ? Published.fromJson(json['published'] as Map<String,dynamic>) : null,
      score = json['score'] as double?,
      scored = json['scored'] as double?,
      scoredBy = json['scored_by'] as int?,
      rank = json['rank'] as int?,
      popularity = json['popularity'] as int?,
      members = json['members'] as int?,
      favorites = json['favorites'] as int?,
      synopsis = json['synopsis'] as String?,
      background = json['background'] as String?,
      authors = (json['authors'] as List?)?.map((dynamic e) => Authors.fromJson(e as Map<String,dynamic>)).toList(),
      serializations = (json['serializations'] as List?)?.map((dynamic e) => Serializations.fromJson(e as Map<String,dynamic>)).toList(),
      genres = (json['genres'] as List?)?.map((dynamic e) => Genres.fromJson(e as Map<String,dynamic>)).toList(),
      explicitGenres = json['explicit_genres'] as List?,
      themes = (json['themes'] as List?)?.map((dynamic e) => Themes.fromJson(e as Map<String,dynamic>)).toList(),
      demographics = (json['demographics'] as List?)?.map((dynamic e) => Demographics.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'url' : url,
    'images' : images?.toJson(),
    'approved' : approved,
    'titles' : titles?.map((e) => e.toJson()).toList(),
    'title' : title,
    'title_english' : titleEnglish,
    'title_japanese' : titleJapanese,
    'title_synonyms' : titleSynonyms,
    'type' : type,
    'chapters' : chapters,
    'volumes' : volumes,
    'status' : status,
    'publishing' : publishing,
    'published' : published?.toJson(),
    'score' : score,
    'scored' : scored,
    'scored_by' : scoredBy,
    'rank' : rank,
    'popularity' : popularity,
    'members' : members,
    'favorites' : favorites,
    'synopsis' : synopsis,
    'background' : background,
    'authors' : authors?.map((e) => e.toJson()).toList(),
    'serializations' : serializations?.map((e) => e.toJson()).toList(),
    'genres' : genres?.map((e) => e.toJson()).toList(),
    'explicit_genres' : explicitGenres,
    'themes' : themes?.map((e) => e.toJson()).toList(),
    'demographics' : demographics?.map((e) => e.toJson()).toList()
  };
}

class Images {
  final Jpg? jpg;
  final Webp? webp;

  Images({
    this.jpg,
    this.webp,
  });

  Images.fromJson(Map<String, dynamic> json)
    : jpg = (json['jpg'] as Map<String,dynamic>?) != null ? Jpg.fromJson(json['jpg'] as Map<String,dynamic>) : null,
      webp = (json['webp'] as Map<String,dynamic>?) != null ? Webp.fromJson(json['webp'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'jpg' : jpg?.toJson(),
    'webp' : webp?.toJson()
  };
}

class Jpg {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Jpg({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Jpg.fromJson(Map<String, dynamic> json)
    : imageUrl = json['image_url'] as String?,
      smallImageUrl = json['small_image_url'] as String?,
      largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class Webp {
  final String? imageUrl;
  final String? smallImageUrl;
  final String? largeImageUrl;

  Webp({
    this.imageUrl,
    this.smallImageUrl,
    this.largeImageUrl,
  });

  Webp.fromJson(Map<String, dynamic> json)
    : imageUrl = json['image_url'] as String?,
      smallImageUrl = json['small_image_url'] as String?,
      largeImageUrl = json['large_image_url'] as String?;

  Map<String, dynamic> toJson() => {
    'image_url' : imageUrl,
    'small_image_url' : smallImageUrl,
    'large_image_url' : largeImageUrl
  };
}

class Titles {
  final String? type;
  final String? title;

  Titles({
    this.type,
    this.title,
  });

  Titles.fromJson(Map<String, dynamic> json)
    : type = json['type'] as String?,
      title = json['title'] as String?;

  Map<String, dynamic> toJson() => {
    'type' : type,
    'title' : title
  };
}

class Published {
  final String? from;
  final dynamic to;
  final Prop? prop;
  final String? string;

  Published({
    this.from,
    this.to,
    this.prop,
    this.string,
  });

  Published.fromJson(Map<String, dynamic> json)
    : from = json['from'] as String?,
      to = json['to'],
      prop = (json['prop'] as Map<String,dynamic>?) != null ? Prop.fromJson(json['prop'] as Map<String,dynamic>) : null,
      string = json['string'] as String?;

  Map<String, dynamic> toJson() => {
    'from' : from,
    'to' : to,
    'prop' : prop?.toJson(),
    'string' : string
  };
}

class Prop {
  final From? from;
  final To? to;

  Prop({
    this.from,
    this.to,
  });

  Prop.fromJson(Map<String, dynamic> json)
    : from = (json['from'] as Map<String,dynamic>?) != null ? From.fromJson(json['from'] as Map<String,dynamic>) : null,
      to = (json['to'] as Map<String,dynamic>?) != null ? To.fromJson(json['to'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'from' : from?.toJson(),
    'to' : to?.toJson()
  };
}

class From {
  final int? day;
  final int? month;
  final int? year;

  From({
    this.day,
    this.month,
    this.year,
  });

  From.fromJson(Map<String, dynamic> json)
    : day = json['day'] as int?,
      month = json['month'] as int?,
      year = json['year'] as int?;

  Map<String, dynamic> toJson() => {
    'day' : day,
    'month' : month,
    'year' : year
  };
}

class To {
  final dynamic day;
  final dynamic month;
  final dynamic year;

  To({
    this.day,
    this.month,
    this.year,
  });

  To.fromJson(Map<String, dynamic> json)
    : day = json['day'],
      month = json['month'],
      year = json['year'];

  Map<String, dynamic> toJson() => {
    'day' : day,
    'month' : month,
    'year' : year
  };
}

class Authors {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Authors({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Authors.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      type = json['type'] as String?,
      name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}

class Serializations {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Serializations({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Serializations.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      type = json['type'] as String?,
      name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}

class Genres {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Genres({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Genres.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      type = json['type'] as String?,
      name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}

class Themes {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Themes({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Themes.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      type = json['type'] as String?,
      name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}

class Demographics {
  final int? malId;
  final String? type;
  final String? name;
  final String? url;

  Demographics({
    this.malId,
    this.type,
    this.name,
    this.url,
  });

  Demographics.fromJson(Map<String, dynamic> json)
    : malId = json['mal_id'] as int?,
      type = json['type'] as String?,
      name = json['name'] as String?,
      url = json['url'] as String?;

  Map<String, dynamic> toJson() => {
    'mal_id' : malId,
    'type' : type,
    'name' : name,
    'url' : url
  };
}