import 'package:flutter/material.dart';
import 'package:google_search_clone/config/api_json.dart';
import 'package:google_search_clone/config/api_keys.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  bool isDummy = true;
  Future<Map<String, dynamic>> fetchData(
      {required String queryTerm, String start = '0'}) async {
    try {
      if (!isDummy) {
        String q = queryTerm.contains(' ')
            ? queryTerm.split(' ').join('%20')
            : queryTerm;
        String url =
            'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start';
        debugPrint;
        final response = await http.get(Uri.parse(
          url,
        ));
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = json.decode(jsonData);
          return resData;
        } else {
          debugPrint("Response status: ${response.statusCode}");
          debugPrint("Response body: ${response.body}");
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return apiResponse;
  }
}