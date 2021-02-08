import 'package:flutter/material.dart';
import 'package:mon_hopital_digital/widgets/medecin/medecinPage.dart';
import 'package:mon_hopital_digital/widgets/navigation.dart';
import 'package:mon_hopital_digital/widgets/patient/patientPage.dart';

class Connexion extends StatefulWidget {

  @override
  _ConnexionState createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: screenHeight / 5.0,
              ),
              Container(
                width: screenWidth * 0.5,
                height: screenWidth * 0.5,
                child: Card(
                  color: Colors.grey[200],
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Image.asset('assets/logo-connexion.png', fit: BoxFit.cover),
                ),
              ),
              Text("Mon Hopital Digital", style: TextStyle(fontSize: 30.0),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                child: Builder(
                  builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nom d'utilisateur",
                          ),
                          validator: (value) {
                            if(value.isEmpty){
                              return "Veuillez rentrer un nom d'utilisateur";
                            }
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if(value.isEmpty){
                              return "Veuillez rentrer un mot de passe";
                            }
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(15.0, 28.0, 15.0, 0),
                          height: 45.0,
                          child: RaisedButton(
                            child: Text("Se connecter",style: TextStyle(fontSize: 19.0, color: Colors.white, fontWeight: FontWeight.bold),),
                            color: Color(0xff19B58B),
                            onPressed: (){
                              final form = _formKey.currentState;
                              if(form.validate()){
                                //form.save();
                              }
                              versNouvellePage(MedecinPage(), context);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
