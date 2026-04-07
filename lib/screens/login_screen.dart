import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../utils/validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  bool isLoading = false;

  void loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      String? token = await ApiService.login(email, password);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token!);

      Navigator.pushReplacementNamed(context, '/dashboard');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
                validator: Validators.emailValidator,
                onChanged: (val) => email = val,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: Validators.passwordValidator,
                onChanged: (val) => password = val,
              ),
              SizedBox(height: 20),

              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: loginUser,
                child: Text("Login"),
              ),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text("Create Account"),
              )
            ],
          ),
        ),
      ),
    );
  }
}