import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.w),
      child: Container(
        height: 25.h,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      'End of Season Sale is LIVE!',
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 4.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(3.w),
                          bottomLeft: Radius.circular(3.w)),
                      color: const Color.fromARGB(255, 240, 133, 11),
                    ),
                    child: const Center(
                      child: Text('80% OFF',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Get ',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 15.sp),
                    ),
                    TextSpan(
                      text: 'FLAT 80% OFF',
                      style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' on all certification courses!',
                      style: TextStyle(
                          color: Colors.grey.shade600, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Icon(
                    Icons.alarm,
                    size: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 2.w),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Offer ends in ',
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15.sp),
                        ),
                        TextSpan(
                          text: '03d: 09h: 56m: 35s',
                          style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 1.h),
              Text(
                'Choose from Web Dev, Python, Data Science,\nMarketing, & more',
                style: TextStyle(color: Colors.grey.shade600, fontSize: 15.sp),
              ),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Platform.isIOS ? 46.w : 50.w,
                    height: 3.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      color: Colors.grey.shade200,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.w),
                      child: Text(
                        'Internhala Certified Trainings',
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: Platform.isIOS ? 14.sp : 15.sp),
                      ),
                    ),
                  ),
                  Text(
                    'Enroll now >',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
