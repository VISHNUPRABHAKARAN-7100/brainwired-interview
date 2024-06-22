import 'package:brainwired_interview/home/model/user_model.dart';
import 'package:brainwired_interview/utils/constant_urls.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<User> users = [];

  Future<void> fetchUsers() async {
    // URL for the API call to fetch users.
    final _url = Uri.parse(ConstantUrls.getUsers);

    try {
      final response = await http.get(
        _url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
      );

      if (response.statusCode == 200) {
        users = userFromJson(response.body);
      } else {
        throw Exception('Failed to fetch users: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
