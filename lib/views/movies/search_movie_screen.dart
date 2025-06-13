import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/routes/route_models/movie_details_route_model.dart';
import 'package:shimmer/shimmer.dart';
import '../../cubits/app_states.dart';
import '../../cubits/movies/search_movie_cubit.dart';
import '../../models/movies/upcoming_movies_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../utils/route_names.dart';
import '../widgets/custom_cached_network_image.dart';
import '../widgets/views_error_handler.dart';

class SearchMovieScreen extends StatefulWidget {
  const SearchMovieScreen({super.key});

  @override
  State<SearchMovieScreen> createState() => _SearchMovieScreenState();
}

class _SearchMovieScreenState extends State<SearchMovieScreen> {
  late SearchMovieCubit searchMovieCubit;

  @override
  void initState() {
    super.initState();
    initCubits();
    callCubits();
  }

  initCubits() {
    searchMovieCubit = context.read<SearchMovieCubit>();
  }

  callCubits() {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchMovieCubit, AppState>(
          listener: (context, state) {
            errorHandler(
              context: context,
              state: state,
            );
          },
        )
      ],
      child: BlocBuilder<SearchMovieCubit, AppState>(
        builder: (context, state) {
          if (state is SuccessState<UpcomingMoviesModel>) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  UpComingMovie? movie = state.data.results?[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      top: 20.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if(movie?.id == null) {
                          return;
                        }
                        Navigator.pushNamed(
                          context,
                          RouteNames.movieDetailsScreen,
                          arguments: MovieDetailsRouteModel(
                            movieId: movie!.id!,
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 100.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 100.h,
                              width: 150.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.r),
                                child: CustomCachedNetworkImage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w500${movie?.backdropPath}'),
                              ),
                            ),
                            21.horizontalSpace,
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie?.originalTitle ?? '',
                                    style: AppFonts.bodyFont(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                    maxLines: 2,
                                  ),
                                  8.verticalSpace,
                                  Text(
                                    movie?.overview ?? '',
                                    style: AppFonts.bodyFont(
                                      color: AppColors.lightTextColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Image.asset(
                              AppAssets.detailsIcon,
                              width: 20.w,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: state.data.results?.length ?? 0,
              ),
            );
          } else if (state is LoadingState) {
            return loadingWidget();
          }
          return const SliverToBoxAdapter();
        },
      ),
    );
  }

  loadingWidget() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              top: 20.h,
            ),
            child: Shimmer.fromColors(
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: SizedBox(
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 100.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(
                          10.r,
                        ),
                      ),
                    ),
                    21.horizontalSpace,
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Image.asset(
                      AppAssets.detailsIcon,
                      width: 20.w,
                    )
                  ],
                ),
              ),
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
