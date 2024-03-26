import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chatgpt_app/api_consts.dart';
import 'package:chatgpt_app/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse(" $BASE_URL/models"),
          headers: {'Authorization': 'Bearer $API_KEY'});

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse['error'] != null) {
        // print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']['message']);
      }

      print("jsonResponse $jsonResponse");
      List temp = [];
      for (var value in jsonResponse["data"]) {
        temp.add(value);
        log("temp $value");
      }
      return ModelsModel.modelsFormSnapshot(temp);
    } catch (error) {
      print("error $error");
      rethrow;
    }
  }
}
