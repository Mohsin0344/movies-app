import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlinedButton extends StatelessWidget {
  final Widget widget;
  final double? height;
  final Function() onTap;

  const AppOutlinedButton({
    super.key,
    required this.widget,
    required this.onTap,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48.h,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        child: widget,
      ),
    );
  }
}
