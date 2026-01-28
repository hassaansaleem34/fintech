import 'package:country_picker/country_picker.dart';
import 'package:fintech/core/routes_screens/link_route.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      localizationsDelegates: const [
        CountryLocalizations.delegate, // for country_picker
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        // add other locales if needed
      ],
      theme: ThemeData(useMaterial3: false, fontFamily: "Lato"),
      initialRoute: '/',
      routes: AppRoutes.routes,
    );
  }
}
