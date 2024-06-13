import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthRepository {
  final String apiUrl = 'http://10.0.2.2:3000/authenticate';

  Future<bool> authenticate(int id, String passcode) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'id': id, 'passcode': passcode}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody['authenticated'] ?? false;
      } else {
        throw Exception('Failed to authenticate: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during authentication: $error');
      rethrow;
    }
  }
}
