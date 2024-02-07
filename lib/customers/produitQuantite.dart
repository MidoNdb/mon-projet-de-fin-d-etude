import 'package:flutter/material.dart';

class Pq extends StatelessWidget {
  final TextEditingController pcontroler;
  final String plabel;
  final String? Function(String?) pvalid;
  final TextInputType typeP;

  final TextEditingController qcontroler;
  final String qlabel;
  final String? Function(String?) qvalid;
  final TextInputType typeQ;

  final TextEditingController prixc;
  final String prixLabel;
  final String? Function(String?) prixValid;
  final TextInputType typePrix;

  const Pq({
    super.key,
    required this.pcontroler,
    required this.plabel,
    required this.pvalid,
    required this.qcontroler,
    required this.qlabel,
    required this.qvalid,
    required this.typeP,
    required this.typeQ,
     required this.prixc,
      required this.prixLabel,
       required this.prixValid,
        required this.typePrix,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              keyboardType: typeP,
              validator: pvalid,
              controller: pcontroler,
              decoration: InputDecoration(
                label: Text(
                  plabel,
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 5, 2, 2))),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              keyboardType: typeQ,
              validator: qvalid,
              controller: qcontroler,
              decoration: InputDecoration(
                label: Text(
                  qlabel,
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
                    color: Colors.black),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 5, 2, 2))),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: TextFormField(
              keyboardType: typePrix,
              validator: prixValid,
              controller: prixc,
              decoration: InputDecoration(
                label: Text(
                  prixLabel,
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
                    borderSide:
                        BorderSide(color: const Color.fromARGB(255, 5, 2, 2))),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
