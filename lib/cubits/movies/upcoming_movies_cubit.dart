import 'package:bloc/bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../api/api_client.dart';
import '../../api/api_methods.dart';
import '../../api/api_routes.dart';
import '../../models/movies/upcoming_movies_model.dart';
import '../app_states.dart';
import '../cubit_exception_handler.dart';

class UpComingMoviesCubit extends Cubit<AppState>
    with ExceptionHandlingMixin<AppState> {
  UpComingMoviesCubit() : super(const InitialState());
  var client = ApiClient();

  getUpcomingMovies({
    int? page,
  }) async {
    try {
      emit(const LoadingState());
      final model = await client.request<UpcomingMoviesModel>(
          endpoint: ApiRoute.upcomingMoviesRoute.path,
          method: ApiMethod.get.value,
          model: UpcomingMoviesModel(),
          queryParams: {
            'api_key': dotenv.env['TMDB_API_KEY'],
            'page': page,
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
