import 'package:flutter/material.dart';
import 'package:mon_hopital_digital/models/Medecin.dart';
import 'package:mon_hopital_digital/extensions/capitalize.dart';

Center contactMedecin(List<Medecin> medecins, BuildContext context){
  double conWidth = MediaQuery.of(context).size.width / 4;

  return Center(
    child: Container(
      height: MediaQuery.of(context).size.height - 120.0,
      padding: EdgeInsets.only(bottom: 30.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: medecins.length,
        itemBuilder: (context, i){
          return Container(
            margin: EdgeInsets.all(6.5),
            child: Container(
              child: Card(
                color: Color(0xFF44E5B7),
                elevation: 10.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: conWidth ,
                      height: conWidth ,
                      margin: EdgeInsets.only(top: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(300.0))
                      ),
                      child: Image.asset("assets/default-profile-picture.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      child: Text("M. ${medecins[i].noms}", style: TextStyle(fontSize: 15.0),),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(horizontal: 40.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        color: Color(0xff19B58B),
                        child: Text("DETAILS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        onPressed: () => detailsMedocDialog(context, medecins[i])
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
      ),
    ),
  );
}

Row afficherInformationInDialog(String titre, donnee, BuildContext context){
  double widthDialog = MediaQuery.of(context).size.width;
  double nomsWidth = widthDialog - 173.7;
  double prenomsWidth = widthDialog - 197.0;
  double specialiteWidth = widthDialog - 191.7;
  double telephoneWidth = widthDialog - 195.667;

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
        width: (titre == "Nom(s)") ? nomsWidth : (titre == "Prenom(s)") ? prenomsWidth : (titre == "Spécialité") ? specialiteWidth : telephoneWidth,
        margin: EdgeInsets.only(left: 10.0),
        child: Text(
          donnee.toString().capitalize(),
          style: TextStyle(color: Colors.grey[600], fontSize: 15.0),
        ),
      )
    ],
  );
}

Future<Null> detailsMedocDialog(BuildContext context, Medecin medecin) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext diaContext){
      return SimpleDialog(
        title: Text("Détails"),
        contentPadding: EdgeInsets.all(10.0),
        children: [
          Container(
            child: afficherInformationInDialog("Nom(s)", medecin.noms, diaContext),
          ),
          Container(
            height: 5.0,
          ),
          Container(
            child: afficherInformationInDialog("Prenom(s)", medecin.prenoms, diaContext),
          ),
          Container(
            height: 5.0,
          ),
          Container(
            child: afficherInformationInDialog("Spécialité", medecin.specialite, diaContext),
          ),
          Container(
            height: 5.0
          ),
          Container(
            child: afficherInformationInDialog("Téléphone", medecin.contact, diaContext),
          ),
        ],
        titleTextStyle: TextStyle(fontSize: 24.0, color: Color(0xFF1DD1A1), fontWeight: FontWeight.bold),
      );
    }
  );
}