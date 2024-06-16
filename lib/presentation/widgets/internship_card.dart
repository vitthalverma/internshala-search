import 'dart:io';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InternshipCard extends StatelessWidget {
  const InternshipCard({
    super.key,
    required this.title,
    required this.companyName,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.location,
    required this.postedTime,
  });
  final String title;
  final String companyName;
  final String startDate;
  final String duration;
  final String stipend;
  final String location;
  final String postedTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.w, horizontal: 0.0),
      child: Container(
        height: 34.3.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        width: 70.w,
                        child: Text(
                          companyName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.network(
                    'https://imgs.search.brave.com/e_meWPuaJ7ozq-S-LNFTLpTHHNyHXaySRCP_o2Ru2X0/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzA0LzQzLzY4Lzcx/LzM2MF9GXzQ0MzY4/NzE4NV95SThpVU52/cHhNeWtIeWRzRDJo/M0JLR0tGWWk0Mm1s/Ri5qcGc',
                    height: 5.h,
                    width: 5.h,
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 18.sp, color: Colors.black45),
                  SizedBox(width: .7.h),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.play_circle_outline_rounded,
                          size: 18.sp, color: Colors.black45),
                      SizedBox(width: .7.h),
                      Text(
                        startDate,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 2.h),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined,
                          size: 17.sp, color: Colors.black45),
                      SizedBox(width: .7.h),
                      Text(
                        duration,
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Icon(Icons.money_outlined,
                      size: 17.sp, color: Colors.black45),
                  SizedBox(width: .7.h),
                  Text(
                    stipend,
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Container(
                width: 14.h,
                color: const Color.fromARGB(255, 221, 248, 222),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 1.w),
                  child: Row(
                    children: [
                      Icon(Icons.av_timer_rounded,
                          size: 17.sp, color: Colors.green),
                      SizedBox(width: .7.h),
                      Text(
                        postedTime,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 66, 163, 69),
                          fontSize: Platform.isIOS ? 14.sp : 15.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: 1.h),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 1.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'View details',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.5.sp,
                      fontWeight: FontWeight.w600,
                    ),
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
