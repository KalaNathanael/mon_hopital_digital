import 'package:flutter/material.dart';
import 'patient_drawer.dart';

class PatientPage extends StatefulWidget {

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {

  List<String> pageNames = ["Dossier Médical", "Rendez-vous", "Contacts médécins"];
  String pageChoisie;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Hopital Digital"),
        backgroundColor: Color(0xFF1DD1A1),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: null
          )
        ],
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Container(
        child: Center(
          child: Text((pageChoisie == null) ? "..." : pageChoisie),
        ),

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
    );
  }

  Text drawerText(String data, {color: Colors.white, fontSize: 17.0, }){
    return Text(

      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize
      ),
    );
  }
}