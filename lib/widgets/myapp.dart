import 'package:flutter/material.dart';
import 'connexion/connexion_page.dart';
import 'package:mon_hopital_digital/widgets/patient/patientPage.dart';
import 'package:hexcolor/hexcolor.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon hopital digital',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Connexion(),
    );
  }
}