import 'package:bloc/bloc.dart';
import '../app_states.dart';

class SearchModeCubit extends Cubit<AppState> {
  SearchModeCubit() : super(const InitialState());

  switchToSearchMode() {
    emit(const SearchState());
  }

  switchToInitialMode() {
    emit(const InitialState());
  }

  searchMovieMode() {
    emit(const SearchMovieState());
  }
}
