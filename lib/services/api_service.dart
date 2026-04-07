import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://reqres.in/api";

  // 🔑 API KEY
  static const String apiKey = "pro_70e0a73d5ff09d50f0602ebcbea36336142130f7eda9cd830537d1d8be77c753";

  // 🔐 LOGIN (unchanged)
  static Future<String?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": apiKey,
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("LOGIN STATUS: ${response.statusCode}");
      print("LOGIN BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data['token'];
      } else {
        throw data['error'] ?? "Login failed";
      }
    } catch (e) {
      print("LOGIN ERROR: $e");
      throw e.toString();
    }
  }

  // 📝 REGISTER (signup → API key confirmed)
  static Future<String?> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/register"),
        headers: {
          "Content-Type": "application/json",
          "x-api-key": apiKey, // 👈 signup me API key added/confirmed
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      print("REGISTER STATUS: ${response.statusCode}");
      print("REGISTER BODY: ${response.body}");

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data['token'];
      } else {
        throw data['error'] ?? "Registration failed";
      }
    } catch (e) {
      print("REGISTER ERROR: $e");
      throw e.toString();
    }
  }
}