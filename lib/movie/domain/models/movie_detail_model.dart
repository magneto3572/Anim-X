class MovieDetailModel {
  MovieDetailModel({
     this.adult,
     this.backdropPath,
     this.belongsToCollection,
     this.budget,
     this.genres,
     this.homepage,
     this.id,
     this.imdbId,
     this.originalLanguage,
     this.originalTitle,
     this.overview,
     this.popularity,
     this.posterPath,
     this.productionCompanies,
     this.productionCountries,
     this.releaseDate,
     this.revenue,
     this.runtime,
     this.spokenLanguages,
     this.status,
     this.tagline,
     this.title,
     this.video,
     this.voteAverage,
     this.voteCount,
     this.videos,
     this.credits,
     this.reviews,
     this.similar,
  });
  bool? adult;
  String? backdropPath;
  dynamic belongsToCollection;
  int? budget;
  List<Genres>? genres;
  String? homepage;
  int? id;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  List<ProductionCompanies>? productionCompanies;
  List<ProductionCountries>? productionCountries;
  String? releaseDate;
  int? revenue;
  int? runtime;
  List<SpokenLanguages>? spokenLanguages;
  String? status;
  String? tagline;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;
  Videos? videos;
  Credits? credits;
  Reviews? reviews;
  Similar? similar;
  
  MovieDetailModel.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    belongsToCollection = null;
    budget = json['budget'];
    genres = List.from(json['genres']).map((e)=>Genres.fromJson(e)).toList();
    homepage = json['homepage'];
    id = json['id'];
    imdbId = json['imdb_id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    productionCompanies = List.from(json['production_companies']).map((e)=>ProductionCompanies.fromJson(e)).toList();
    productionCountries = List.from(json['production_countries']).map((e)=>ProductionCountries.fromJson(e)).toList();
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    spokenLanguages = List.from(json['spoken_languages']).map((e)=>SpokenLanguages.fromJson(e)).toList();
    status = json['status'];
    tagline = json['tagline'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    videos = Videos.fromJson(json['videos']);
    credits = Credits.fromJson(json['credits']);
    reviews = Reviews.fromJson(json['reviews']);
    similar = Similar.fromJson(json['similar']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['belongs_to_collection'] = belongsToCollection;
    _data['budget'] = budget;
    _data['genres'] = genres?.map((e)=>e.toJson()).toList();
    _data['homepage'] = homepage;
    _data['id'] = id;
    _data['imdb_id'] = imdbId;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['popularity'] = popularity;
    _data['poster_path'] = posterPath;
    _data['production_companies'] = productionCompanies?.map((e)=>e.toJson()).toList();
    _data['production_countries'] = productionCountries?.map((e)=>e.toJson()).toList();
    _data['release_date'] = releaseDate;
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['spoken_languages'] = spokenLanguages?.map((e)=>e.toJson()).toList();
    _data['status'] = status;
    _data['tagline'] = tagline;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    _data['videos'] = videos?.toJson();
    _data['credits'] = credits?.toJson();
    _data['reviews'] = reviews?.toJson();
    _data['similar'] = similar?.toJson();
    return _data;
  }
}

class Genres {
  Genres({
     this.id,
     this.name,
  });
  int? id;
  String? name;
  
  Genres.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}

class ProductionCompanies {
  ProductionCompanies({
     this.id,
     this.logoPath,
     this.name,
     this.originCountry,
  });
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;
  
  ProductionCompanies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['logo_path'] = logoPath;
    _data['name'] = name;
    _data['origin_country'] = originCountry;
    return _data;
  }
}

class ProductionCountries {
  ProductionCountries({
     this.iso_3166_1,
     this.name,
  });
  String? iso_3166_1;
  String? name;
  
  ProductionCountries.fromJson(Map<String, dynamic> json){
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iso_3166_1'] = iso_3166_1;
    _data['name'] = name;
    return _data;
  }
}

class SpokenLanguages {
  SpokenLanguages({
     this.englishName,
     this.iso_639_1,
     this.name,
  });
  String? englishName;
  String? iso_639_1;
  String? name;
  
  SpokenLanguages.fromJson(Map<String, dynamic> json){
    englishName = json['english_name'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['english_name'] = englishName;
    _data['iso_639_1'] = iso_639_1;
    _data['name'] = name;
    return _data;
  }
}

class Videos {
  Videos({
     this.results,
  });
  List<Results>? results;
  
  Videos.fromJson(Map<String, dynamic> json){
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Results {
  Results({
     this.iso_639_1,
     this.iso_3166_1,
     this.name,
     this.key,
     this.site,
     this.size,
     this.type,
     this.official,
     this.publishedAt,
     this.id,
  });
  String? iso_639_1;
  String? iso_3166_1;
  String? name;
  String? key;
  String? site;
  int? size;
  String? type;
  bool? official;
  String? publishedAt;
  dynamic id;
  
  Results.fromJson(Map<String, dynamic> json){
    iso_639_1 = json['iso_639_1'];
    iso_3166_1 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    publishedAt = json['published_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['iso_639_1'] = iso_639_1;
    _data['iso_3166_1'] = iso_3166_1;
    _data['name'] = name;
    _data['key'] = key;
    _data['site'] = site;
    _data['size'] = size;
    _data['type'] = type;
    _data['official'] = official;
    _data['published_at'] = publishedAt;
    _data['id'] = id;
    return _data;
  }
}

class Credits {
  Credits({
     this.cast,
     this.crew,
  });
  List<Cast>? cast;
  List<Crew>? crew;
  
  Credits.fromJson(Map<String, dynamic> json){
    cast = List.from(json['cast']).map((e)=>Cast.fromJson(e)).toList();
    crew = List.from(json['crew']).map((e)=>Crew.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cast'] = cast?.map((e)=>e.toJson()).toList();
    _data['crew'] = crew?.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Cast {
  Cast({
     this.adult,
     this.gender,
     this.id,
     this.knownForDepartment,
     this.name,
     this.originalName,
     this.popularity,
     this.profilePath,
     this.castId,
     this.character,
     this.creditId,
     this.order,
  });
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  int? castId;
  String? character;
  String? creditId;
  int? order;
  
  Cast.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    _data['cast_id'] = castId;
    _data['character'] = character;
    _data['credit_id'] = creditId;
    _data['order'] = order;
    return _data;
  }
}

class Crew {
  Crew({
     this.adult,
     this.gender,
     this.id,
     this.knownForDepartment,
     this.name,
     this.originalName,
     this.popularity,
     this.profilePath,
     this.creditId,
     this.department,
     this.job,
  });
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;
  
  Crew.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = null;
    creditId = json['credit_id'];
    department = json['department'];
    job = json['job'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['gender'] = gender;
    _data['id'] = id;
    _data['known_for_department'] = knownForDepartment;
    _data['name'] = name;
    _data['original_name'] = originalName;
    _data['popularity'] = popularity;
    _data['profile_path'] = profilePath;
    _data['credit_id'] = creditId;
    _data['department'] = department;
    _data['job'] = job;
    return _data;
  }
}

class Reviews {
  Reviews({
     this.page,
     this.results,
     this.totalPages,
     this.totalResults,
  });
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  
  Reviews.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results?.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}

class Similar {
  Similar({
     this.page,
     this.results,
     this.totalPages,
     this.totalResults,
  });
  int? page;
  List<Results>? results;
  int? totalPages;
  int? totalResults;
  
  Similar.fromJson(Map<String, dynamic> json){
    page = json['page'];
    results = List.from(json['results']).map((e)=>Results.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['page'] = page;
    _data['results'] = results?.map((e)=>e.toJson()).toList();
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}