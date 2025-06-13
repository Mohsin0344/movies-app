enum ApiRoute {
  testRoute,
  upcomingMoviesRoute,
  searchMovieRoute,
  movieDetailsRoute,
}

extension ApiRouteExtension on ApiRoute {
  String get path {
    switch (this) {
      case ApiRoute.testRoute:
        return '/ping';
      case ApiRoute.upcomingMoviesRoute:
        return '/movie/upcoming';
      case ApiRoute.searchMovieRoute:
        return '/search/movie';
      case ApiRoute.movieDetailsRoute:
        return '/movie';
    }
  }
}
