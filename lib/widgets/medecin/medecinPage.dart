import 'package:flutter/material.dart';
import 'package:mon_hopital_digital/widgets/connexion/connexion_page.dart';
import 'package:mon_hopital_digital/widgets/medecin/disponibilit%C3%A9.dart';
import 'package:mon_hopital_digital/widgets/navigation.dart';

import '../drawerText.dart';

class MedecinPage extends StatefulWidget {
  @override
  _MedecinPageState createState() => _MedecinPageState();
}

class _MedecinPageState extends State<MedecinPage> {
  List<String> pageNames = ["Disponibilté", "Réunions", "Consultations"];
  String pageChoisie = "Disponibilté";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Hopital Digital"),
        backgroundColor: Color(0xFFFD79A8),
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
                        child: Image.asset("assets/logo-medecin.png"),
                      ),
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
          color: Color(0xFFFD79A8),
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
            Disponibilite(MediaQuery.of(context).size.height),
            // (pageChoisie == "Contacts médécins") ? contactMedecin(medecins, context) :
            //   (pageChoisie == "Rendez-vous")? rendezVous() :
            //     dossierMedical(screenWidth, patient, context)
          ],
        ),
      )
    );
  }
}
