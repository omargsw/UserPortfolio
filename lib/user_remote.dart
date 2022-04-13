import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:task1/model/user.dart';

class UserRemote {
  static Future<User> fetchUser() async {
    //TODO: Split the URL into variables and use them here.
    //TODO: Put it in a try catch
    final response = await http.get(Uri.parse(
        'https://compassionate-austin.65-108-72-55.plesk.page/wp-json/wp/v2/posts/13'));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User Info');
    }
  }
}
