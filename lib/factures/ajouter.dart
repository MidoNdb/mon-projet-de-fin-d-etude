import 'package:facturation/factures/subTotal.dart';
import 'package:facturation/main.dart';
import 'package:flutter/material.dart';
import 'package:facturation/customers/httpApis.dart';
import 'package:facturation/customers/inputs.dart';
import 'package:facturation/constants/links.dart';
import 'package:facturation/customers/validation.dart';
import 'package:facturation/customers/produitQuantite.dart';

class AjouterFacture extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateAjouter();
  }
}

class StateAjouter extends State<StatefulWidget> {
  GlobalKey<FormState> formestate = GlobalKey<FormState>();
  List<Pq> formFields = [];

  TextEditingController titre = TextEditingController();
  TextEditingController descF = TextEditingController();
  TextEditingController nomF = TextEditingController();
  TextEditingController emailF = TextEditingController();
  TextEditingController nomC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateD = TextEditingController();
  TextEditingController datF = TextEditingController();
  TextEditingController produit = TextEditingController();
  TextEditingController quantitP = TextEditingController();
  TextEditingController prixCo = TextEditingController();

  // HttpApis _httpApis = HttpApis();
  // bool islooding = false;
  createMap() {
    if (formestate.currentState!.validate()) {
      Map<String, dynamic> map3 = {
        "titre": titre.text,
        "descf":descF.text,
        "nomf": nomF.text,
        "emailf": emailF.text,
        "nomc": nomC.text,
        "emailc": emailC.text,
        "datef": dateD.text,
        "datep": datF.text,
        "produit": produit.text,
        "quantite": int.parse(quantitP.text),
        "prix": double.parse(prixCo.text)
      };
      Map<String, dynamic> maMap = {};
      maMap.addAll(map3);
      int i = 0;
      for (Pq tf in formFields) {
        i++;
        maMap["produit$i"] = tf.pcontroler.text;
        maMap["quantite$i"] = int.parse(tf.qcontroler.text);
        maMap["prix$i"] = double.parse(tf.prixc.text);
      }
      return maMap;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("ajouter une facture")),
        body: Container(
            padding: EdgeInsets.all(10),
            child: Form(
                key: formestate,
                child: ListView(children: <Widget>[
                  Text(
                    "titre de facture",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  InputForm(
                    mycontroler: titre,
                    label: "titre",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.text,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  InputForm(
                    mycontroler: descF,
                    label: "description",
                    valid: (val) {
                      return valid(val!, 1, 255);
                    },
                    typeInput: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "from",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: nomF,
                    label: " nom fournisseur",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: emailF,
                    label: "email fournisseur",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "to",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: nomC,
                    label: "nom client",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.name,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: emailC,
                    label: "email client",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Date de creation de facture",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: dateD,
                    label: "date creation",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.datetime,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Date de paiment de facture",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputForm(
                    mycontroler: datF,
                    label: "date creation",
                    valid: (val) {
                      return valid(val!, 1, 50);
                    },
                    typeInput: TextInputType.datetime,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Pq(
                    typeP: TextInputType.text,
                    pcontroler: produit,
                    plabel: "produit",
                    pvalid: (val) {
                      return valid(val!, 1, 30);
                    },
                    typeQ: TextInputType.number,
                    qcontroler: quantitP,
                    qlabel: "quantite produit",
                    qvalid: (val) {
                      return valid(val!, 1, 5);
                    },
                    prixc: prixCo,
                    prixLabel: 'prix',
                    prixValid: (val) {
                      return valid(val!, 1, 8);
                    },
                    typePrix: TextInputType.number,
                  ),
                  Column(
                    children: formFields,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {
                            setState(() {
                              if (formFields.isNotEmpty) {
                                formFields.removeLast();
                              }
                            });
                          },
                          icon: Icon(
                            Icons.minimize,
                            color: Colors.blue,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              TextEditingController cp =
                                  TextEditingController();
                              TextEditingController cq =
                                  TextEditingController();
                              TextEditingController prixco =
                                  TextEditingController();
                              formFields.add(Pq(
                                typeP: TextInputType.text,
                                pcontroler: cp,
                                plabel: "produit",
                                pvalid: (val) {
                                  return valid(val!, 1, 30);
                                },
                                typeQ: TextInputType.number,
                                qcontroler: cq,
                                qlabel: "quantité",
                                qvalid: (val) {
                                  return valid(val!, 1, 30);
                                },
                                prixc: prixco,
                                prixLabel: 'prix',
                                prixValid: (val) {
                                  return valid(val!, 1, 10);
                                },
                                typePrix: TextInputType.number,
                              ));
                            });
                          },
                          icon: Icon(
                            Icons.add,
                            color: Colors.blue,
                            size: 30,
                          ))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 400,
                    height: 60,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.lightBlue,
                      onPressed: () {
                        if (formestate.currentState!.validate()) {
                          double subTotal = double.parse(quantitP.text) *
                              double.parse(prixCo.text);
                          for (Pq tf in formFields) {
                            subTotal = subTotal +
                                double.parse(tf.qcontroler.text) *
                                    double.parse(tf.prixc.text);
                          }
                          sharedPref.setDouble("subtotal", subTotal);
                          Map map = createMap();

                          Navigator.of(context)
                              .pushNamed("subT", arguments: map);
                        }
                      },
                      child: Text("Proceed to checkout"),
                      textColor: Colors.white,
                    ),
                  )
                ]))));
  }
}
