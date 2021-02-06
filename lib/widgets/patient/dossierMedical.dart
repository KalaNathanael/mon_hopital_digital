import 'package:flutter/material.dart';
import 'package:mon_hopital_digital/models/Allergie.dart';
import 'package:mon_hopital_digital/models/Patient.dart';
import 'dart:async';
import 'package:mon_hopital_digital/extensions/capitalize.dart';

Center dossierMedical(double screenWidth, Patient patient, BuildContext context) {
  double conWidth = screenWidth * 0.7;
  double secWidth = screenWidth * 0.9;


  return Center(
    child: new Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Color(0xFF1DD1A1),
            ),
            width: conWidth,
            margin: EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: conWidth - 20.0,
                  height: conWidth - 20.0,
                  margin: EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(300.0))
                  ),
                  child: Image.asset("assets/default-profile-picture.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  width: conWidth,
                  color: Colors.white,
                  child: Text("${patient.noms.toUpperCase()} ${patient.prenoms}",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey,),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
        ),
        Container(
          width: secWidth,
          margin: EdgeInsets.only(top: 50.0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // -- debut card information de base --
              Container(
                width: secWidth,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Color(0xFF1DD1A1),
                child: Text("Informations de base",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                width: secWidth,
                padding: EdgeInsets.all(10.0),
                color: Color(0xFFBFFFEE),
                child: Column(
                  children: [
                    afficherInformation("Noms(s)", patient.noms),
                    afficherInformation("Prenoms(s)", patient.prenoms),
                    afficherInformation("Sexe", patient.sexe),
                    afficherInformation("Date de Naissance", patient.date_naissance),
                    afficherInformation("Lieu de Naissance", patient.lieu_naissance),
                    afficherInformation("Poids", patient.poids, patient: patient),
                    afficherInformation("Contact", patient.contact),
                    Container(
                      width: secWidth,
                      height: 5.0,
                      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      color: Color(0xFF1DD1A1),
                    ),
                    afficherInformation("Groupe Sanguin", patient.bonASavoir.groupe_sanguin),
                    afficherInformation("Rhesus", patient.bonASavoir.rhesus),
                    afficherInformation("Contact d'urgence", patient.bonASavoir.contact_urgence),
                    afficherInformation("Allergie(s)", ""),
                    afficherAllergies(patient.bonASavoir.allergies, context),
                  ],
                ),
              ),
              // -- fin card information de base --

              Container(
                height: 40.0,
              ),

              // -- debut antécédents --
              Container(
                width: secWidth,
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Color(0xFF1DD1A1),
                child: Text("Antécédents",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, bottom: 15.0),
                width: secWidth,
                height: 200.0,
                padding: EdgeInsets.all(10.0),
                color: Color(0xFFBFFFEE),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Row afficherInformation(String titre, donnee, {patient: Patient}){
  patient = Patient.empty();
  return Row(
    children: [
      Container(
        child: Text(
          '$titre :',
          style: TextStyle(color: Color(0xFF0D0A0B), fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          "$donnee ${(donnee == patient.poids)? " Kg": ""}" ,
          style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
        ),
      )
    ],
  );
}

Row afficherInformationInDialog(String titre, donnee, BuildContext context){
  double widthDialog = MediaQuery.of(context).size.width;
  double causeWidth = widthDialog - 165.0;
  double cureWidth = widthDialog - 153.0;
  double preventionWidth = widthDialog - 199.0;

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: Text(
          '${titre.capitalize()} :',
          style: TextStyle(color: Color(0xFF0D0A0B), fontWeight: FontWeight.bold, fontSize: 15.0),
        ),
      ),
      Container(
        width: (titre == "Cause") ? causeWidth : (titre == "Cure") ? cureWidth : preventionWidth,
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          donnee.toString().capitalize(),
          style: TextStyle(color: Colors.grey[600], fontSize: 15.0),

        ),
      )
    ],
  );
}

Column afficherAllergies(List<Allergie> allergies, BuildContext context){
  List<Widget> infoAllergies = [];

  for (var allergie in allergies) {
    InkWell ink = InkWell(
      child: Container(
        margin: EdgeInsets.only(left:10.0),
        child: Row(
          children: [
            Icon(Icons.add_circle_outline),
            Container(
              margin: EdgeInsets.only(left:4.0),
              child: Text(allergie.nom.capitalize()),
            )
          ],
        ),
      ),
      onTap: () => infoSupAllergieDialog(context, allergie),
    );

    infoAllergies.add(ink);
  }

  return Column(
    children: infoAllergies,
  );
}

Future<Null> infoSupAllergieDialog(BuildContext context, Allergie allergie) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext diaContext){
      return SimpleDialog(
        title: Text(allergie.nom.capitalize()),
        contentPadding: EdgeInsets.all(10.0),
        children: [
          Container(
            child: afficherInformationInDialog("Cause", allergie.cause, diaContext),
          ),
          Container(
            height: 5.0,
          ),
          Container(
            child: afficherInformationInDialog("Cure", allergie.cure, diaContext),
          ),
          Container(
            height: 5.0,
          ),
          Container(
            child: afficherInformationInDialog("Prévention", allergie.prevention, diaContext),
          ),
        ],
        titleTextStyle: TextStyle(fontSize: 24.0, color: Color(0xFF1DD1A1), fontWeight: FontWeight.bold),

      );
    }
  );
}