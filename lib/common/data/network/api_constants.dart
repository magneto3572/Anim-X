

class ApiConstants {
  static const String baseUrl = 'https://api.consumet.org';
  static const String apiKey = '3805c86cf85d0dd3ef7de9f844e13ef8';
  static const String tmdbBaseUrl = "https://api.themoviedb.org/3";
  static const String posterPath = "https://image.tmdb.org/t/p/w500";

  static String getAiringManga(){
    return'$baseUrl/anime/gogoanime/top-airing';
  }

  static String getFeaturedManga() {
      return '$baseUrl/anime/gogoanime/recent-episodes';
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
}
