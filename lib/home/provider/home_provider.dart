import 'package:brainwired_interview/home/model/user_model.dart';
import 'package:brainwired_interview/utils/constant_urls.dart';
import 'package:brainwired_interview/utils/custom_enums.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  List<User> users = [];

  LoadingState? loadingState;

  String? _error;
  String? get error => _error;

  Future<void> fetchUsers() async {
    loadingState = LoadingState.loading;
    notifyListeners();
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
        loadingState = LoadingState.success;
        users = userFromJson(response.body);
        notifyListeners();
      } else {
        loadingState = LoadingState.error;
        notifyListeners();
      }
    } catch (e) {
      loadingState = LoadingState.error;
      _error = e.toString();
      notifyListeners();
      return;
    }
  }
}
