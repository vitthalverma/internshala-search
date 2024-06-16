import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShimmerCard extends StatelessWidget {
  const ShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 1.5.h,
              width: 80.w,
              color: Colors.white,
            ),
            SizedBox(height: 1.h),
            Container(
              height: 1.5.h,
              width: 60.w,
              color: Colors.white,
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                Container(
                  height: 1.5.h,
                  width: 40.w,
                  color: Colors.white,
                ),
                SizedBox(width: 2.w),
                Container(
                  height: 1.5.h,
                  width: 30.w,
                  color: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Container(
              height: 1.5.h,
              width: 50.w,
              color: Colors.white,
            ),
            SizedBox(height: 1.h),
            Container(
              height: 1.5.h,
              width: 30.w,
              color: Colors.white,
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 1.5.h,
                  width: 40.w,
                  color: Colors.white,
                ),
                Container(
                  height: 1.5.h,
                  width: 20.w,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
