import 'dart:developer';

import 'package:countries_info/routes.dart';
import 'package:countries_info/views/pages/countries.services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void setupLocator() {
  GetIt.I.registerLazySingleton(() => CountryService());
}

void main() {
  setupLocator();
  runApp(PalotaCountriesAssessmentApp());
}

class PalotaCountriesAssessmentApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.startUp,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
