import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:task1/model/user.dart';

class UserRemote {
  static Future<User> fetchUser() async {
    String url =
        'https://compassionate-austin.65-108-72-55.plesk.page/wp-json/wp/v2/posts/13';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load User Info');
    }
  }
}
