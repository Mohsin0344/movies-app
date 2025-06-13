import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/views/widgets/app_elevated_button.dart';
import '../../models/reservations/seat_model.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_fonts.dart';
import 'reservation_sliver_app_bar.dart';

enum SeatState {
  selected,
  available,
  notAvailable,
}

enum SeatType {
  regular,
  vip,
}

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<List<Seat?>> cinemaLayout = [
    [
      null,
      null,
      null,
      Seat(id: 'A1', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A2', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'A3', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A4', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A5', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'A6', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'A7', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'A8', type: SeatType.regular, state: SeatState.notAvailable),
    ],
    [
      null,
      Seat(id: 'B1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B3', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'B5', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B7', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B8', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B9', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B10', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B11', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'B13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B14', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B15', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B16', type: SeatType.regular, state: SeatState.available),
    ],
    [
      null,
      Seat(id: 'B1', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B2', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B3', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'B5', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B7', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B8', type: SeatType.regular, state: SeatState.selected),
      Seat(id: 'B9', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B10', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B11', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'B13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B14', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B15', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B16', type: SeatType.regular, state: SeatState.notAvailable),
    ],
    [
      null,
      Seat(id: 'B1', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B3', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B4', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'B5', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B7', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B8', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B9', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B10', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B11', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B12', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'B13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B14', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'B15', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'B16', type: SeatType.regular, state: SeatState.notAvailable),
    ],
    [
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E3', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E5', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E7', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E8', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E9', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E10', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E11', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'E13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E14', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E15', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
    ],
    [
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E3', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E5', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E7', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E8', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E9', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E10', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E11', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E14', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E15', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.notAvailable),
    ],
    [
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E3', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E5', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E7', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E8', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E9', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E10', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E11', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'E13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E14', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E15', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
    ],
    [
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E2', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E3', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E5', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E6', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E7', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E8', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E9', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E10', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E11', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E14', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E15', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.notAvailable),
    ],
    [
      Seat(id: 'E1', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E2', type: SeatType.regular, state: SeatState.selected),
      Seat(id: 'E3', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E4', type: SeatType.regular, state: SeatState.notAvailable),
      null,
      Seat(id: 'E5', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E6', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E7', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E8', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E9', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E10', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E11', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.regular, state: SeatState.available),
      null,
      Seat(id: 'E13', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E14', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E15', type: SeatType.regular, state: SeatState.notAvailable),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.regular, state: SeatState.available),
    ],
    [
      Seat(id: 'E1', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E2', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E3', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E4', type: SeatType.vip, state: SeatState.available),
      null,
      Seat(id: 'E5', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E6', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E7', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E8', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E9', type: SeatType.vip, state: SeatState.notAvailable),
      Seat(id: 'E10', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E11', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E12', type: SeatType.vip, state: SeatState.available),
      null,
      Seat(id: 'E13', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E14', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E15', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.vip, state: SeatState.available),
      Seat(id: 'E16', type: SeatType.vip, state: SeatState.available),
    ],
  ];
  final TransformationController _controller = TransformationController();

  void _zoomIn() {
    _controller.value = Matrix4.identity()..scale(1.5);
  }

  void _zoomOut() {
    _controller.value = Matrix4.identity()..scale(0.8);
  }

  void _resetZoom() {
    _controller.value = Matrix4.identity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const ReservationSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                InteractiveViewer(
                  transformationController: _controller,
                  minScale: 0.5,
                  maxScale: 3.0,
                  child: Column(
                    children: [
                      60.verticalSpace,
                      SizedBox(
                        width: 397.w,
                        child: Stack(
                          children: [
                            Image.asset(
                              AppAssets.screenImage,
                            ),
                            Positioned(
                              left: 180.w,
                              // right: 150.w,
                              top: 10.h,
                              child: Text(
                                'SCREEN',
                                style: AppFonts.bodyFont(
                                  color: AppColors.overviewColor,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      20.verticalSpace,
                      SizedBox(
                        height: 0.40.sh,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          itemBuilder: (context, parentIndex) {
                            return Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    (parentIndex + 1).toString(),
                                    style: AppFonts.bodyFont(
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 14,
                                  child: Wrap(
                                    spacing: 6.w,
                                    children: List.generate(
                                      cinemaLayout[parentIndex].length,
                                      (childIndex) {
                                        if (cinemaLayout[parentIndex]
                                                [childIndex] !=
                                            null) {
                                          return GestureDetector(
                                            onTap: () {
                                              if (cinemaLayout[parentIndex]
                                                          [childIndex]
                                                      ?.state ==
                                                  SeatState.notAvailable) {
                                                return;
                                              }
                                              setState(() {
                                                if(cinemaLayout[parentIndex]
                                                [childIndex]
                                                    ?.state == SeatState.selected) {
                                                  cinemaLayout[parentIndex]
                                                  [childIndex]
                                                      ?.state =
                                                      SeatState.available;
                                                } else {
                                                  cinemaLayout[parentIndex]
                                                  [childIndex]
                                                      ?.state =
                                                      SeatState.selected;
                                                }
                                              });
                                            },
                                            child: Image.asset(
                                              width: 10.w,
                                              AppAssets.seatImage,
                                              color: getSeatColor(
                                                seat: cinemaLayout[parentIndex]
                                                    [childIndex]!,
                                              ),
                                            ),
                                          );
                                        }
                                        return SizedBox(
                                          width: 10.w,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) => 7.verticalSpace,
                          itemCount: cinemaLayout.length,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _zoomIn();
                      },
                      child: SizedBox(
                        height: 36.h,
                        width: 36.w,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.add,
                            color: AppColors.black,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        _zoomOut();
                      },
                      child: SizedBox(
                        height: 36.h,
                        width: 36.w,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                          child: Icon(
                            Icons.minimize_outlined,
                            color: AppColors.black,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                                        seatColor: AppColors.selectedColor,
                                      ),
                                      seatAnnotationWidget(
                                        title: 'Not available',
                                        seatColor: AppColors.notAvailableColor,
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
                                        seatColor: AppColors.vipColor,
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
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 10.sp,
                                                  color: AppColors.black,
                                                ),
                                              ),
                                            ],
                                          ),
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

  getSeatColor({required Seat seat}) {
    if (seat.state == SeatState.notAvailable) {
      return AppColors.notAvailableColor;
    }
    if (seat.state == SeatState.selected) {
      return AppColors.selectedColor;
    }
    if (seat.type == SeatType.vip) {
      return AppColors.vipColor;
    } else if (seat.type == SeatType.regular) {
      return AppColors.elevatedButtonColor;
    } else {
      return null;
    }
  }
}
