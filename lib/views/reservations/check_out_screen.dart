import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/views/widgets/app_elevated_button.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'reservation_sliver_app_bar.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ReservationSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: 0.52.sh,
                ),
                SizedBox(
                  height: 280.h,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      color: AppColors.primaryColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 26.h,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 340.w,
                            height: 53.h,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      seatAnnotationWidget(
                                        title: 'Selected',
                                        seatColor: Colors.red,
                                      ),
                                      seatAnnotationWidget(
                                        title: 'Not available',
                                        seatColor: AppColors.overviewColor,
                                      ),
                                    ],
                                  ),
                                ),
                                15.verticalSpace,
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      seatAnnotationWidget(
                                        title: 'VIP (\$150)',
                                        seatColor: AppColors.purpleColor,
                                      ),
                                      seatAnnotationWidget(
                                        title: 'Regular (\$50)',
                                        seatColor:
                                            AppColors.elevatedButtonColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          32.verticalSpace,
                          SizedBox(
                            height: 30.h,
                            width: 97.w,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: AppColors.lightGrey,
                                borderRadius: BorderRadius.circular(
                                  10.r,
                                ),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 6.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(
                                              text: '4 /',
                                              style: AppFonts.bodyFont(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.sp,
                                                color: AppColors.black,
                                              ),
                                              children: [
                                                TextSpan(
                                                    text: ' 3 row',
                                                    style: AppFonts.bodyFont(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 10.sp,
                                                      color: AppColors.black,
                                                    )),
                                              ]),
                                        ),
                                      ),
                                      Icon(
                                        Icons.close,
                                        size: 12.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          35.verticalSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  height: 50.h,
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: AppColors.lightGrey,
                                      borderRadius: BorderRadius.circular(
                                        10.r,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Total Price',
                                          style: AppFonts.bodyFont(
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                        Text(
                                          '\$ 50',
                                          style: AppFonts.bodyFont(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              10.horizontalSpace,
                              Expanded(
                                flex: 3,
                                child: AppElevatedButton(
                                  widget: const Text('Proceed to pay'),
                                  onTap: () {},
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  seatAnnotationWidget({
    required String title,
    required Color seatColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset(
          AppAssets.seatImage,
          color: seatColor,
          width: 25.w,
        ),
        13.horizontalSpace,
        Text(
          title,
          style: AppFonts.bodyFont(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
