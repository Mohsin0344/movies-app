import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/utils/debounce.dart';
import '../../cubits/movies/search_movie_cubit.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import '../../cubits/app_states.dart';
import '../../cubits/movies/search_mode_cubit.dart';

class SearchSliverAppBar extends StatefulWidget {
  const SearchSliverAppBar({super.key});

  @override
  State<SearchSliverAppBar> createState() => _SearchSliverAppBarState();
}

class _SearchSliverAppBarState extends State<SearchSliverAppBar> {
  late SearchModeCubit searchModeCubit;
  late SearchMovieCubit searchMovieCubit;
  Debounce debounce = Debounce(
    milliseconds: 500,
  );

  @override
  void initState() {
    initCubits();
    callCubits();
    super.initState();
  }

  initCubits() {
    searchModeCubit = context.read<SearchModeCubit>();
    searchMovieCubit = context.read<SearchMovieCubit>();
  }

  callCubits() {
    searchModeCubit.switchToInitialMode();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 70.h,
      automaticallyImplyLeading: false,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(sizeFactor: animation, child: child),
            ),
            child: BlocBuilder<SearchModeCubit, AppState>(
              builder: (context, state) {
                if (state is SearchState || state is SearchMovieState) {
                  return TextField(
                    key: const ValueKey('searchField'),
                    controller: searchMovieCubit.searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'TV shoes, movies and more',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          searchModeCubit.switchToInitialMode();
                          searchMovieCubit.searchController.clear();
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.black,
                    ),
                    onChanged: (val) {
                      debounce.run(() {
                        searchModeCubit.searchMovieMode();
                        searchMovieCubit.searchMovie(
                          query: searchMovieCubit.searchController.text,
                        );
                      });
                    },
                  );
                }
                return Row(
                  key: const ValueKey('titleRow'),
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Watch',
                      style: AppFonts.bodyFont(
                        color: AppColors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        searchModeCubit.switchToSearchMode();
                      },
                      icon: const Icon(Icons.search),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
