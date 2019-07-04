import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Returns user information
class LoginService {
  Future<dynamic> getUser(String id) async {
    http.Response res = await http.get('https://jsonplaceholder.typicode.com/users/$id');
    return jsonDecode(res.body);
  }
}
