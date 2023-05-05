import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

//later..
class NewProvider with ChangeNotifier {
  final List news = [];
  Future getData() async {
    var url = Uri.parse("https://thiet.edu.eg/api/news");
    final response = await http.get(url);
    final responseBody = jsonDecode(response.body);
    print(responseBody);
    notifyListeners();
  }
}
