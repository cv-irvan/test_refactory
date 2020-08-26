import 'dart:convert';
import 'package:http/http.dart' as client;
import 'package:testapp_refactory/model/getDataModel.dart';

class ApiProvider {
  String url =
      "https://my-json-server.typicode.com/glendmaatita/userjsondemo/db";

  Future<GetDataModel> getData() async {
    final response = await client.get("$url");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GetDataModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
