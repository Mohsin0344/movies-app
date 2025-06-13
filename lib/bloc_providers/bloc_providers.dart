import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/cubits/movies/movie_trailer_cubit.dart';
import 'package:movies_app/cubits/movies/search_movie_cubit.dart';
import '../cubits/movies/movie_details_cubit.dart';
import '../cubits/movies/search_mode_cubit.dart';
import '../cubits/movies/upcoming_movies_cubit.dart';
import '../cubits/test_view_model.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<TestViewModel>(
      create: (context) => TestViewModel(),
    ),
    BlocProvider<UpComingMoviesCubit>(
      create: (context) => UpComingMoviesCubit(),
    ),
    BlocProvider<SearchModeCubit>(
      create: (context) => SearchModeCubit(),
    ),
    BlocProvider<SearchMovieCubit>(
      create: (context) => SearchMovieCubit(),
    ),
    BlocProvider<MovieDetailsCubit>(
      create: (context) => MovieDetailsCubit(),
    ),
    BlocProvider<MovieTrailerCubit>(
      create: (context) => MovieTrailerCubit(),
    )
  ];
}
