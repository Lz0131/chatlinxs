import 'package:chatlinxs/views/onboarding_page/onboarding_page.dart';
import 'package:chatlinxs/views/root_page.dart';
import 'package:chatlinxs/views/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ScrollGlowEffect extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatLinxs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: "SFProText",
        useMaterial3: true,
      ),
      builder: (context, child) {
        return ScrollConfiguration(behavior: ScrollGlowEffect(), child: child!);
      },
      home: const OnBoardingPage(),
    );
  }
}
