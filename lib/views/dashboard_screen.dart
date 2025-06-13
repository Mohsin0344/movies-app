import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/views/movies/upcoming_movies_screen.dart';
import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_fonts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1;
  List navBarItemTitles = [
    'Dashboard',
    'Watch',
    'Media Library',
    'More',
  ];

  List navBarItemAssets = [
     AppAssets.dashboardIcon,
     AppAssets.watchIcon,
     AppAssets.libraryIcon,
     AppAssets.moreIcon,
  ];

  final List<Widget> _screens = [
    const SizedBox(),
    const UpComingMoviesScreen(),
    const SizedBox(),
    const SizedBox(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 80.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.purpleColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(32.r),
              topLeft: Radius.circular(32.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                navBarItemTitles.length,
                (index) => navbarItem(
                  title: navBarItemTitles[index],
                  isActive: index == _selectedIndex,
                  onTap: () => _onItemTapped(index),
                  iconImage: navBarItemAssets[index]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  navbarItem({
    required String title,
    required bool isActive,
    required Function() onTap,
    required String iconImage
  }) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.transparent
        ),
        child: Column(
          children: [
            Image.asset(
              iconImage,
              color: isActive
                  ? AppColors.secondaryColor
                  : AppColors.unSelectedItemColor,
              height: 24.h,
              width: 24.w,
            ),
            4.verticalSpace,
            Text(
              title,
              style: AppFonts.bodyFont(
                color: isActive
                    ? AppColors.secondaryColor
                    : AppColors.unSelectedItemColor,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
