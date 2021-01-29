
import 'package:flutter/material.dart';

Drawer patientDrawer(BuildContext context, List<String> pageNames, Function state){

  return Drawer(
    child: Container(
     child:  ListView.builder(
        itemCount: pageNames.length,
        itemBuilder: (context, i){
          return ListTile(
            title: Text(pageNames[i]),
            onTap: () {
              state(i);
            },
          );
        }
      ),
      color: Color(0xFF1DD1A1),
    ),

  );
}