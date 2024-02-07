import 'package:facturation/customers/validation.dart';
import 'package:facturation/main.dart';
import 'package:flutter/material.dart';
import 'package:facturation/customers/httpApis.dart';
import 'package:facturation/constants/links.dart';

class SunTotal extends StatefulWidget {
  const SunTotal({
    super.key,
  });
  @override
  State<StatefulWidget> createState() {
    return _SubT();
  }
}

class _SubT extends State<StatefulWidget> {
  GlobalKey<FormState> formstate = GlobalKey();
  List<MaterialButton> buttons = [];
  List<Text> text1 = [];
  List<Text> text2 = [];
  TextEditingController CTva = TextEditingController();
  TextEditingController remiseC = TextEditingController();

  double subt = 0.0;

  HttpApis _httpApis = HttpApis();

  @override
  Widget build(BuildContext context) {
    dynamic maMapp = ModalRoute.of(context)!.settings.arguments;
    double? arg = sharedPref.getDouble("subtotal");
    Map<String, dynamic> mapp = Map<String, dynamic>.from(maMapp);
    addfactures() async {
      // if (formstate.currentState!.validate()) {
      //   mapp.addAll({"montant": subt});
      //   var response= await _httpApis.postRequest(lnkAjouter, mapp);
      //   print(mapp);
      //   print(response);
      //   if ( response != null && response["status"] == "success"){
      //   Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      // }
      // }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("sub total"),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: formstate,
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Sub total",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  MaterialButton(
                    onPressed: null,
                    child: Text("$arg",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 0.0),
                    child: Text("TVA",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  )),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        return valid(val!, 1, 10);
                      },
                      controller: CTva,
                      decoration: InputDecoration(
                        label: Text(
                          "tva",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[200],
                        helperStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 5, 2, 2))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 120),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Remise",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        return valid(val!, 1, 10);
                      },
                      controller: remiseC,
                      decoration: InputDecoration(
                        label: Text(
                          "remise",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[200],
                        helperStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: const Color.fromARGB(255, 5, 2, 2))),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: MaterialButton(
                minWidth: 200,
                onPressed: () {
                  if (formstate.currentState!.validate()) {
                    setState(() {
                      subt = double.parse("$arg");
                      double subt1 =
                          subt + subt * (double.parse(CTva.text) / 100);
                      double total =
                          subt1 - subt1 * (double.parse(remiseC.text) / 100);
                      subt = total;

                      if (text1.isNotEmpty) {
                        text1.removeLast();
                      }
                      text1.add(Text("total",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)));

                      if (text2.isNotEmpty) {
                        text2.removeLast();
                      }
                      text2.add(Text("$subt",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)));
                    });
                  }
                },
                color: Colors.blue,
                child: Text("calculer total",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: Column(children: text1)),
            SizedBox(
              height: 20,
            ),
            Center(child: Column(children: text2)),
            SizedBox(
              height: 20,
            ),
            Center(child: Column(children: buttons)),
          ],
        ),
      ),
    );
  }
}
