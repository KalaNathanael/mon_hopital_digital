
import 'package:mon_hopital_digital/models/Allergie.dart';

class BonASavoir {
  String groupe_sanguin;
  String rhesus;
  String contact_urgence;
  List<Allergie> allergies;

  BonASavoir({this.contact_urgence, this.groupe_sanguin, this.rhesus, this.allergies});

  BonASavoir.empty(){
    groupe_sanguin = "";
    rhesus = "";
    contact_urgence = "";
    allergies = [];
  }
}