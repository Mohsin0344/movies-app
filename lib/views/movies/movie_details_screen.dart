import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/app_fonts.dart';
import 'package:movies_app/views/widgets/app_elevated_button.dart';
import 'package:movies_app/views/widgets/custom_cached_network_image.dart';
import 'package:movies_app/views/widgets/loading_indicator.dart';
import 'package:movies_app/views/widgets/views_error_handler.dart';

import '../../cubits/app_states.dart';
import '../../cubits/movies/movie_details_cubit.dart';
import '../../models/movies/movie_details_model.dart';
import '../../routes/route_models/movie_details_route_model.dart';
import '../../utils/app_colors.dart';
import '../../utils/route_names.dart';
import '../widgets/app_outlined_button.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({
    super.key,
    required this.movieId,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MovieDetailsCubit movieDetailsCubit;
  final random = Random();

  @override
  void initState() {
    super.initState();
    initCubits();
    callCubits();
  }

  initCubits() {
    movieDetailsCubit = context.read<MovieDetailsCubit>();
  }

  callCubits() {
    movieDetailsCubit.getMovieDetails(
      movieId: widget.movieId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<MovieDetailsCubit, AppState>(
            listener: (context, state) {
              errorHandler(
                context: context,
                state: state,
              );
            },
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<MovieDetailsCubit, AppState>(
            builder: (context, state) {
              if (state is SuccessState<MovieDetailsModel>) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 454.h,
                      pinned: true,
                      leading: const BackButton(
                        color: AppColors.secondaryColor,
                      ),
                      flexibleSpace: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          final top = constraints.biggest.height;
                          final isCollapsed = top <=
                              kToolbarHeight +
                                  MediaQuery.of(context).padding.top;

                          return FlexibleSpaceBar(
                            centerTitle: true,
                            title: isCollapsed
                                ? Text(
                                    state.data.originalTitle ?? '',
                                    style: AppFonts.bodyFont(
                                      color: AppColors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                : null,
                            background: Stack(
                              fit: StackFit.expand,
                              children: [
                                CustomCachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500/${state.data.posterPath}',
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.transparent,
                                        Colors.black.withOpacity(0.6)
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 159.h,
                                  left: 66.w,
                                  right: 66.w,
                                  child: Text(
                                    'In Theaters December 22, 2021',
                                    style: AppFonts.bodyFont(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp,
                                      color: AppColors.secondaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Positioned(
                                  bottom: 94.h,
                                  left: 66.w,
                                  right: 66.w,
                                  child: Center(
                                    child: SizedBox(
                                      width: 300.w,
                                      child: AppElevatedButton(
                                        widget: const Text('Get Tickets'),
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RouteNames.reservationScreen,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 34.h,
                                  left: 66.w,
                                  right: 66.w,
                                  child: Center(
                                    child: SizedBox(
                                      width: 300.w,
                                      child: AppOutlinedButton(
                                        widget: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.play_arrow,
                                              color: AppColors.secondaryColor,
                                            ),
                                            Text('Watch Trailer'),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            RouteNames.movieTrailerPlayerScreen,
                                            arguments: MovieDetailsRouteModel(
                                              movieId: widget.movieId,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 40.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Genres',
                              style: AppFonts.bodyFont(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            14.verticalSpace,
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: List.generate(
                                state.data.genres?.length ?? 0,
                                (index) {
                                  final color = Color.fromARGB(
                                    255,
                                    random.nextInt(256),
                                    random.nextInt(256),
                                    random.nextInt(256),
                                  );

                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.w, vertical: 4.h),
                                    decoration: BoxDecoration(
                                      color: color,
                                      borderRadius: BorderRadius.circular(26.r),
                                    ),
                                    child: Text(
                                      state.data.genres?[index].name ?? '',
                                      style: AppFonts.bodyFont(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            37.verticalSpace,
                            Text(
                              'Overview',
                              style: AppFonts.bodyFont(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            14.verticalSpace,
                            Text(
                              state.data.overview ?? '',
                              style: AppFonts.bodyFont(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.overviewColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: LoadingIndicator(
                  color: AppColors.purpleColor,
                ),
              );
            },
          ),
        ));
  }
}
