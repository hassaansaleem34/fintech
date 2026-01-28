import 'package:fintech/core/routes_screens/link_route.dart';

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
      routes: AppRoutes.routes,
    );
  }
}
