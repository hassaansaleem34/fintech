import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/features/authentication/address_screen/address_screen.dart';
import 'package:fintech/features/authentication/otp_screen/otp_screen.dart';
import 'package:fintech/features/authentication/sign_up/signup_screen.dart';
import 'package:fintech/features/authentication/info_screen/info_screen.dart';

import 'package:fintech/features/onboard_screens/views_ui/onboard_screen.dart';
import 'package:fintech/features/splash_screen/views_ui/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fintech',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false, fontFamily: "Lato"),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        MyRoutes.onBoardScreen: (context) => OnBoardScreen(),
        MyRoutes.signUp: (context) => SignUpScreen(),
        MyRoutes.otpVerify: (context) => OtpScreen(),
        MyRoutes.infoScreen: (context) => InfoScreen(),
        MyRoutes.addressScreen: (context) => AddressScreen(),
      },
    );
  }
}
