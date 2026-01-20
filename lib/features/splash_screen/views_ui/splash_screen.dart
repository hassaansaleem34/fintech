import 'dart:async';

import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
   
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, MyRoutes.onBoardScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SvgPicture.asset(AppAssets.appLogo)],
          ),
        ),
      ),
    );
  }
}
