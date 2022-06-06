import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:userinformationapp/model_data.dart';

class Service {
  final String _dataUrl =
      "https://mocki.io/v1/e3bb2e7a-11d0-4eb0-b29e-d7c99c43237e";
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
