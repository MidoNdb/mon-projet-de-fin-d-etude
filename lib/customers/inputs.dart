import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final TextEditingController mycontroler;
  final String label;
  final TextInputType typeInput ;
  final String? Function(String?) valid;

  const InputForm({
    super.key,
    required this.mycontroler,
    required this.label,
    required this.valid, required this.typeInput,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:typeInput ,
      validator: valid,
      controller: mycontroler,
      decoration: InputDecoration(
        label: Text(
          label,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey),
        ),
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.grey[200],
        helperStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 16, color: Colors.grey),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: const Color.fromARGB(255, 5, 2, 2))),
      ),
    );
  }
}
