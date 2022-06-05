import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:userinformationapp/model_data.dart';

class Service {
  final String _dataUrl =
      "https://mocki.io/v1/9f33a807-04fd-4404-a7a4-e3048a29e9a1";
  var client = http.Client();

  Future<List<ModelData>?> getData() async {
    http.Response? response;
    List<ModelData>? dataList;

    try {
      Uri url = Uri.parse(_dataUrl);
      response = await client.get(url);
      var data = jsonDecode(response.body);

      dataList = List.from(data.map((val) => ModelData.fromJson(val)));
    } catch (e) {
      debugPrint(e.toString());
    }
    return dataList;
  }
}
