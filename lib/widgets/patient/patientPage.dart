import 'package:flutter/material.dart';
import 'package:mon_hopital_digital/models/Allergie.dart';
import 'package:mon_hopital_digital/models/BonASavoir.dart';
import 'package:mon_hopital_digital/models/Medecin.dart';
import 'package:mon_hopital_digital/models/Patient.dart';
import '../drawerText.dart';
import '../navigation.dart';
import 'contactMedecin.dart';
import 'dossierMedical.dart';
import 'patient_drawer.dart';
import '../connexion/connexion_page.dart';

class PatientPage extends StatefulWidget {

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {

  List<String> pageNames = ["Dossier Médical", "Rendez-vous", "Contacts médécins"];
  String pageChoisie = "Dossier Médical";
  List<Allergie> patient_allergies = [
    new Allergie(nom: "eczéma", cause: "arachide", cure :"Quand l'allergène responsable est identifié, il faut la bannir", prevention:"Eviter l'allergène"),
    new Allergie(nom: "allergies aux acariens", cause: "les matelas, la laine, la plume")
  ];
  BonASavoir patient_bonasavoir = new BonASavoir(contact_urgence: "699105745", groupe_sanguin: "O", rhesus:"Rh+");

  Patient patient = new Patient(noms:"Kala", prenoms: "Nathanaël", date_naissance: "30/09/1999", sexe: "M", poids: 90.1,
                                contact: "655801590", lieu_naissance: "Yaoundé");

  List<Medecin> medecins;


  @override
  Widget build(BuildContext context){

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    patient_bonasavoir.allergies = patient_allergies;
    patient.bonASavoir = patient_bonasavoir;

    medecins = genererListeMedecins(12);

    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Hopital Digital"),
        backgroundColor: Color(0xFF1DD1A1),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: null
          ),
          IconButton(
            icon: Icon(Icons.power_settings_new),
            onPressed: () => versNouvellePage(Connexion(), context)
          )
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      drawer: Drawer(
        child: Container(
          child:  ListView.builder(
            itemCount: pageNames.length + 1,
            itemBuilder: (context, i){
              if(i == 0){
                return DrawerHeader(
                  child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset("assets/logo-patient.png"),
                      )
                  ),
                  margin: EdgeInsets.only(bottom: 40.0),
                );
              }
              return ListTile(
                leading: Icon(
                  Icons.api,
                  color: Colors.white,
                ),
                title: drawerText(pageNames[i-1]),
                onTap: () {
                  setState(() {
                    pageChoisie = pageNames[i-1];
                    Navigator.pop(context);
                  });
                },
              );
            }
          ),
          color: Color(0xFF1DD1A1),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  Container(
                    child: Icon(Icons.api,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                  ),
                  Container(
                    child: Text((pageChoisie == null)? "..." : pageChoisie,
                      style: TextStyle(fontSize: 20.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            (pageChoisie == "Contacts médécins") ? contactMedecin(medecins, context) :
              (pageChoisie == "Rendez-vous")? rendezVous() :
                dossierMedical(screenWidth, patient, context)
          ],
        ),
      )

    );
  }

  Column rendezVous() {

  }

  List<Medecin> genererListeMedecins(int nombre){
    List<Medecin> aRetourner = [];
    for(int i = 0; i < nombre; i++){
      aRetourner.add(Medecin(
        noms: "Medoc${i+1}",
        prenoms: "Prey non ${i+1}",
        login: "login${i+1}",
        password: "password${i+1}",
        role: "role${i+1}",
        sexe: "sexe${i+1}",
        date_naissance: "01/01/1980",
        dateFinService: "${i+1}/01/2021",
        datePriseService: "${i+1}/01/2007",
        specialite: "spec${i+1}",
        contact: "65580159${(i+1)%10}"
      ));
    }
    return aRetourner;
  }


}