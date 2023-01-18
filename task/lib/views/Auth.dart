import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/view_models/AuthViewModel.dart';

class Auth extends StatelessWidget {
  Auth({super.key});

  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _userData = {"email": "", "password": ""};

  static const routeName = "Auth";

  Future _tryToLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        await Provider.of<AuthViewModel>(context, listen: false).login(
          _userData['email']!,
          _userData['password']!,
        );
      } catch (err) {
        print(err);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Please try again"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the email";
                    } else {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value.trim());
                      if (!emailValid) {
                        return "Please enter a valid email";
                      }
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    label: const Text("Email"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onSaved: (value) {
                    _userData['email'] = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter the password";
                    } else if (value.length < 5) {
                      return "Please password length most be at least 5 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    label: const Text("Password"),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                  onSaved: (value) {
                    _userData['password'] = value!.trim();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white
                        ),
                        onPressed: () async {
                          await _tryToLogin(context);
                        },
                        child: const Text("LOGIN"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
