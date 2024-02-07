import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpApis {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print("error ${response.statusCode}");
      }
    } catch (e) {
      print("&e");
    }
  }

  postRequest(String url, Map<String,dynamic> donnes) async {
    try {
      var response = await http.post(Uri.parse(url), body: donnes);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data;
      } else {
        print("error ${response.statusCode}");
      }
    } catch (e) {
      print("&e");
    }
  }
}
