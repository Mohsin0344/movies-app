import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../api/api_client.dart';
import '../../api/api_methods.dart';
import '../../api/api_routes.dart';
import '../../models/movies/movie_details_model.dart';
import '../app_states.dart';
import '../cubit_exception_handler.dart';

class MovieDetailsCubit extends Cubit<AppState>
    with ExceptionHandlingMixin<AppState> {
  MovieDetailsCubit() : super(const InitialState());
  var client = ApiClient();

  getMovieDetails({
    required int movieId,
  }) async {
    try {
      emit(const LoadingState());
      final model = await client.request<MovieDetailsModel>(
          endpoint: '${ApiRoute.movieDetailsRoute.path}/$movieId',
          method: ApiMethod.get.value,
          model: MovieDetailsModel(),
          queryParams: {
            'api_key': dotenv.env['TMDB_API_KEY'],
          });
      emit(
        SuccessState(
          data: model,
        ),
      );
    } catch (e) {
      handleException(e);
    }
  }
}
