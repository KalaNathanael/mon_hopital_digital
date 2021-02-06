
import 'dart:math';

import 'package:mon_hopital_digital/models/BonASavoir.dart';
import 'package:mon_hopital_digital/models/Personne.dart';

class Patient extends Personne{
  String lieu_naissance;
  double poids;
  String contact;
  BonASavoir bonASavoir;

  Patient({this.lieu_naissance, this.poids, this.contact, this.bonASavoir,
    String noms, String prenoms, String login, String sexe, String date_naissance, String password, String role}):
        super(noms: noms, prenoms: prenoms, login: login, sexe: sexe, date_naissance: date_naissance, password: password, role: role);

  Patient.empty() : super.empty(){
    // noms = "";
    // prenoms = "";
    // login = "";
    // sexe = "";
    // date_naissance = "";
    // password = "";
    // role = "";
    lieu_naissance = "";
    poids = 0.0;
    contact = "";
    bonASavoir = BonASavoir.empty();
  }
}