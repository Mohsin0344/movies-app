import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/utils/app_fonts.dart';
import 'package:movies_app/views/reservations/reservation_sliver_app_bar.dart';
import 'package:movies_app/views/widgets/app_elevated_button.dart';

import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/route_names.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  final List<DateTime> upcomingDates = List.generate(
    30,
    (index) => DateTime.now().add(Duration(days: index)),
  );
  int selectedDateIndex = 0;
  int selectedHallIndex = 0;
  final DateFormat dateFormat = DateFormat('d MMM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const ReservationSliverAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      94.verticalSpace,
                      Text(
                        'Date',
                        style: AppFonts.bodyFont(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      14.verticalSpace,
                      SizedBox(
                        height: 32.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: upcomingDates.length,
                          itemBuilder: (context, index) {
                            final date = upcomingDates[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedDateIndex = index;
                                });
                              },
                              child: Container(
                                // height: 32.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 32.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  color: selectedDateIndex == index
                                      ? AppColors.elevatedButtonColor
                                      : Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    dateFormat.format(date),
                                    style: AppFonts.bodyFont(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: selectedDateIndex == index
                                          ? AppColors.secondaryColor
                                          : AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              12.horizontalSpace,
                        ),
                      ),
                      39.verticalSpace,
                      SizedBox(
                        height: 180.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedHallIndex = index;
                                });
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: '12:30',
                                      style: AppFonts.bodyFont(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: 10.horizontalSpace,
                                        ),
                                        TextSpan(
                                          text: 'Cinetech + Hall 1',
                                          style: AppFonts.bodyFont(
                                            color: AppColors.overviewColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.verticalSpace,
                                  Expanded(
                                    child: SizedBox(
                                      height: 145.h,
                                      width: 249.w,
                                      child: DecoratedBox(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: selectedHallIndex == index
                                                ? AppColors.elevatedButtonColor
                                                : AppColors.lightTextColor,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10.r,
                                          ),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                            AppAssets.seatingsImage,
                                            width: 145.w,
                                            height: 113.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  10.verticalSpace,
                                  RichText(
                                    text: TextSpan(
                                      text: 'From',
                                      style: AppFonts.bodyFont(
                                        color: AppColors.overviewColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12.sp,
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: 10.horizontalSpace,
                                        ),
                                        TextSpan(
                                          text: '\$50',
                                          style: AppFonts.bodyFont(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' or ',
                                          style: AppFonts.bodyFont(
                                            color: AppColors.overviewColor,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '2500 bonus',
                                          style: AppFonts.bodyFont(
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              12.horizontalSpace,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 26.h,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 423.w,
                child: AppElevatedButton(
                  widget: const Text('Select Seats'),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.checkoutScreen,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
