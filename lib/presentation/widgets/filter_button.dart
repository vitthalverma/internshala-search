import 'package:flutter/material.dart';
import 'package:internshala_search/presentation/screens/filter_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FilterButton extends StatelessWidget {
  const FilterButton(
      {super.key,
      required this.onTap,
      required this.showFunnel,
      required this.filterCount});
  final void Function() onTap;
  final bool showFunnel;
  final int filterCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 9.5.h,
        height: 3.5.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
          border: Border.all(color: Colors.blue),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: Row(
            children: [
              if (showFunnel)
                Icon(Icons.filter_alt_outlined,
                    size: 17.sp, color: Colors.blue),
              Text(
                'Filters',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.5.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (!showFunnel)
                Padding(
                  padding: EdgeInsets.only(left: 1.w),
                  child: Container(
                    height: 2.h,
                    width: 2.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        filterCount.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
