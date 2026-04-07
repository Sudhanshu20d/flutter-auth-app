import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../utils/validators.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String confirmPassword = "";
  bool isLoading = false;

  void registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    if (password != confirmPassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    setState(() => isLoading = true);

    try {
      await ApiService.register(email, password);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registered Successfully")));

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
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
              TextFormField(
                decoration: InputDecoration(labelText: "Confirm Password"),
                obscureText: true,
                onChanged: (val) => confirmPassword = val,
              ),
              SizedBox(height: 20),

              isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: registerUser,
                child: Text("Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}