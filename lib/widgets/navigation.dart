import 'package:flutter/material.dart';

void versNouvellePage(Widget page, BuildContext pageContext) {
  Navigator.push(pageContext, MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}