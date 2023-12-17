class ApiConstants {
  static const String baseUrl = 'https://api.jikan.moe';
  static const String apiKey = '3805c86cf85d0dd3ef7de9f844e13ef8';
  static const String tmdbBaseUrl = "https://api.themoviedb.org/3";
  static const String posterPath = "https://image.tmdb.org/t/p/w500";
  static const String baseVideoUrl = 'https://www.youtube.com/watch?v=';
  static const String mangaBaseUrl = "https://myanimelist.p.rapidapi.com";

  static String getAiringManga() {
    return '$baseUrl/v4/top/anime';
  }

  static String getFeaturedManga() {
    return '$baseUrl/v4/seasons/upcoming';
  }

  static String getTopManga() {
    return '$mangaBaseUrl/manga/top/all';
  }

  static String getUpcomingMovie(int page) {
    return "$tmdbBaseUrl/movie/upcoming?language=en-US&page=$page";
  }

  static String getPopularMovie(int page) {
    return '$tmdbBaseUrl/movie/popular?language=en-US&page=$page';
  }

  static String getTopRatedMovies(int page) {
    return '$tmdbBaseUrl/movie/top_rated?language=en-US&page=$page';
  }

  static String getMovieDetailById(int movieId) {
    return '$tmdbBaseUrl/movie/$movieId?api_key=$apiKey&append_to_response=videos,credits,reviews,similar';
  }
}
