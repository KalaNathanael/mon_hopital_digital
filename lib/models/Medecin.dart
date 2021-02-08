
import 'package:mon_hopital_digital/models/Personne.dart';

class Medecin extends Personne {
  String datePriseService;
  String dateFinService;
  String specialite;

  Medecin({this.dateFinService, this.datePriseService, this.specialite,
    String noms, String prenoms, String login, String sexe, String date_naissance, String password, String role, String contact})
      :super(noms: noms, prenoms: prenoms, date_naissance: date_naissance, sexe: sexe,
             role: role, password: password, login: password, contact: contact);

  Medecin.empty() : super.empty(){
    datePriseService = "";
    dateFinService = "";
    specialite = "";
  }
}