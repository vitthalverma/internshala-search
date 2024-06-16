import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.width,
      required this.height,
      required this.ontap,
      required this.borderRadius,
      required this.child,
      required this.color});
  final double width;
  final double height;
  final VoidCallback ontap;
  final double borderRadius;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: Colors.blue),
          ),
          child: Center(child: child)),
    );
  }
}
