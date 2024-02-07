import 'package:shared_preferences/shared_preferences.dart';

import 'package:facturation/factures/ajouter.dart';
import 'package:flutter/material.dart';
import 'package:facturation/factures/home.dart';
import 'package:facturation/factures/dashbord.dart';
import 'package:facturation/factures/subTotal.dart';
late SharedPreferences sharedPref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp( MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "App facturation",
      initialRoute:"dashbord",
      routes: {
        "ajouter": (context) => AjouterFacture(),
        "home": (context) => Home(),
        "dashbord": (context)=>Dachbord(),
        "subT": (context)=>SunTotal()
      }
  
      )
  );
}
