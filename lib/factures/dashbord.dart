import 'package:flutter/material.dart';

class Dachbord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Dashbord"),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil("dashbord", (route) => false);
              },
              child: Text(
                "Dashbord",
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: (){
                Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
              },
              child: Text(
                "Factures",
                style: TextStyle(color: Colors.white,fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Text(
            "Facturation",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(" Mohamed",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
          Text(" mohamed salem",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          
          Text(" fatimetou",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
