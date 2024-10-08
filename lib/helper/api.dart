import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({
    required String url,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    http.Response response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
        "There is proplem with status code ${response.statusCode}",
      );
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
        "There is proplem with status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  }

  Future<dynamic> put({
    required String url,
    dynamic body,
    String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    debugPrint("URL = $url , Body = $body , Token=$token");
    http.Response response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    headers.addAll(
      {
        "Content-Type": "application/x-www-form-urlencoded",
      },
    );
    if (response.statusCode == 200) {
      debugPrint("URL = $url , Body = $body , Token=$token");
      Map<String, dynamic> data = jsonDecode(response.body);
      debugPrint(data.toString());
      return data;
    } else {
      throw Exception(
        "There is proplem with status code ${response.statusCode} with body ${jsonDecode(response.body)}",
      );
    }
  }
}
