import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:internshala_search/presentation/screens/intern_list_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (p0, p1, p2) {
      return MaterialApp(
        title: 'Internshala',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          chipTheme: const ChipThemeData(
              surfaceTintColor: Colors.white, backgroundColor: Colors.white),
          appBarTheme: const AppBarTheme(
              color: Colors.white, surfaceTintColor: Colors.white),
          bottomAppBarTheme:
              const BottomAppBarTheme(surfaceTintColor: Colors.white),
        ),
        home: AnimatedSplashScreen(
          splash: SizedBox(
              height: 20.h,
              width: 20.h,
              child: Image.asset(
                'assets/internlogo.webp',
                fit: BoxFit.cover,
              )),
          nextScreen: const InternshipListScreen(),
        ),
      );
    });
  }
}
