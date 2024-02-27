import 'package:flutter/material.dart';
import 'package:rickandmortyapp/models/character_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider with ChangeNotifier {
  final url = 'rickandmortyapi.com';
  List<Character> characteres = [];

  Future<void> getCharacteres() async {
    final result = await http.get(Uri.https(url, "/api/character"));
    final response = characterResponseFromJson(result.body);
    characteres.addAll(response.results!);
    notifyListeners();
  }
}
