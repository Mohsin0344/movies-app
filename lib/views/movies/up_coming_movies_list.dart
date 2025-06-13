import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../cubits/app_states.dart';
import '../../cubits/movies/upcoming_movies_cubit.dart';
import '../../models/movies/upcoming_movies_model.dart';
import '../../routes/route_models/movie_details_route_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/route_names.dart';
import '../widgets/custom_cached_network_image.dart';
import '../widgets/loading_indicator.dart';
import '../widgets/views_error_handler.dart';

class UpComingMoviesList extends StatefulWidget {
  final bool? isGrid;
  final PagingController<int, UpComingMovie> pagingController;

  const UpComingMoviesList({
    super.key,
    this.isGrid,
    required this.pagingController,
  });

  @override
  State<UpComingMoviesList> createState() => _UpComingMoviesListState();
}

class _UpComingMoviesListState extends State<UpComingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UpComingMoviesCubit, AppState>(
          listener: (context, state) {
            if (state is SuccessState<UpcomingMoviesModel>) {
              final results = state.data.results ?? [];
              final currentPage = state.data.page ?? 0;
              final totalPages = state.data.totalPages ?? 0;

              final nextPageKey =
                  currentPage < totalPages ? currentPage + 1 : null;

              widget.pagingController.appendPage(results, nextPageKey);
            }
            errorHandler(
              context: context,
              state: state,
            );
          },
        )
      ],
      child: !(widget.isGrid ?? false)
          ? PagedSliverList.separated(
              pagingController: widget.pagingController,
              builderDelegate: PagedChildBuilderDelegate<UpComingMovie>(
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: LoadingIndicator(
                    color: AppColors.purpleColor,
                  ),
                ),
                itemBuilder: (context, movie, index) => SizedBox(
                  height: 180.h,
                  width: 335.w,
                  child: movieCard(movie: movie),
                ),
              ),
              separatorBuilder: (context, index) {
                return 20.verticalSpace;
              },
            )
          : PagedSliverGrid(
              pagingController: widget.pagingController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 1.8,
              ),
              builderDelegate: PagedChildBuilderDelegate<UpComingMovie>(
                firstPageProgressIndicatorBuilder: (context) => const Center(
                  child: LoadingIndicator(
                    color: AppColors.purpleColor,
                  ),
                ),
                itemBuilder: (context, movie, index) {
                  return movieCard(movie: movie);
                },
              ),
            ),
    );
  }

  movieCard({required UpComingMovie movie}) {
    return GestureDetector(
      onTap: () {
        if(movie.id == null) {
          return;
        }
        Navigator.pushNamed(
          context,
          RouteNames.movieDetailsScreen,
          arguments: MovieDetailsRouteModel(movieId: movie.id!),
        );
      },
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              14.r,
            ),
            child: SizedBox(
              width: 440.w,
              child: CustomCachedNetworkImage(
                imageUrl:
                    'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: !(widget.isGrid ?? false) ? 60.h : 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.40),
                    Colors.black.withOpacity(0.37),
                    Colors.black.withOpacity(0.33),
                    Colors.black.withOpacity(0.30),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: !(widget.isGrid ?? false) ? 20.h : 20.h,
            left: 10.w,
            child: SizedBox(
              width: !(widget.isGrid ?? false) ? 380.w : 180.w,
              child: Text(
                movie.originalTitle ?? '',
                style: AppFonts.bodyFont(
                  fontWeight: FontWeight.w500,
                  fontSize: !(widget.isGrid ?? false) ? 22.sp : 18.sp,
                  color: AppColors.primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
