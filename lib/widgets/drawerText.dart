import 'package:flutter/material.dart';

Text drawerText(String data, {color: Colors.white, fontSize: 17.0, }){
  return Text(
    data,
    style: TextStyle(
        color: color,
        fontSize: fontSize
    ),
  );
}


