import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movies_app/utils/app_fonts.dart';
import '../../cubits/app_states.dart';
import '../../cubits/movies/search_mode_cubit.dart';
import '../../cubits/movies/upcoming_movies_cubit.dart';
import '../../models/movies/upcoming_movies_model.dart';
import 'search_movie_screen.dart';
import 'search_sliver_app_bar.dart';
import '../../utils/app_colors.dart';
import 'up_coming_movies_list.dart';

class UpComingMoviesScreen extends StatefulWidget {
  const UpComingMoviesScreen({super.key});

  @override
  State<UpComingMoviesScreen> createState() => _UpComingMoviesScreenState();
}

class _UpComingMoviesScreenState extends State<UpComingMoviesScreen> {
  late SearchModeCubit searchModeCubit;
  late UpComingMoviesCubit upComingMoviesCubit;
  final TextEditingController searchController = TextEditingController();
  final PagingController<int, UpComingMovie> pagingController =
      PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    initCubits();
    callCubits();
    super.initState();
  }

  initCubits() {
    searchModeCubit = context.read<SearchModeCubit>();
    upComingMoviesCubit = context.read<UpComingMoviesCubit>();
  }

  callCubits() {
    searchModeCubit.switchToInitialMode();
    pagingController.addPageRequestListener((pageKey) {
      upComingMoviesCubit.getUpcomingMovies(
        page: pageKey,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SearchSliverAppBar(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<SearchModeCubit, AppState>(
            builder: (context, state) {
              if (state is SearchMovieState) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: SizedBox(
                    height: 25.h,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.grey, width: 0.5))),
                      child: Text(
                        'Top Results',
                        style: AppFonts.bodyFont(
                          color: AppColors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          sliver: BlocBuilder<SearchModeCubit, AppState>(
            builder: (context, state) {
              if (state is InitialState || state is SearchState) {
                return UpComingMoviesList(
                  isGrid: state is SearchState,
                  pagingController: pagingController,
                );
              }
              return SearchMovieScreen();
            },
          ),
        ),
      ],
    );
  }
}
