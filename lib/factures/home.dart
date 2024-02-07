import 'package:facturation/constants/links.dart';
import 'package:flutter/material.dart';
import 'package:facturation/customers/httpApis.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StateHome();
  }
}

class StateHome extends State<StatefulWidget> {
  HttpApis _httpApis = HttpApis();
  getFactures() async {
    var response =
        await _httpApis.getRequest("http://10.0.2.2/facturation/Show.php");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Factures"),
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
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("dashbord", (route) => false);
              },
              child: Text(
                "Dashbord",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            MaterialButton(
              minWidth: 200,
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("home", (route) => false);
              },
              child: Text(
                "Factures",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("ajouter");
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          FutureBuilder(
              future: getFactures(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Column(
                        children: [
                          (Text("${snapshot.data[i]["Titre"]}")),
                          (Text("${snapshot.data[i]["DescF"]}")),
                          (Text("${snapshot.data[i]["Status"]}")),
                          (Text("${snapshot.data[i]["Montant"]}"))
                        ],
                      ));
                    },
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Text("Looding...!!!"),
                  );
                }
                return Center(
                  child: Text("looding ..."),
                );
              })
        ],
      ),
    );
  }
}
