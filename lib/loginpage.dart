import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;// For toggling password visibility
  final url ="https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAuLzhhDxG-XXOshwyH8xFkv-lSRNAG9Gw";
  Future<void>LOGIN()async{
    final email = _emailController.text;
    final pass = _passwordController.text;
    print(email);
    final res = await http.post(Uri.parse(url),body: json.encode(
      {
        "email":email,
        'password':pass,
        'returnSecureToken':true


      }
    ));
    print(res.statusCode);


  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 48,
                  width: 300,
                  child: TextFormField(
                    controller: _emailController, // Use the controller
                    keyboardType: TextInputType.emailAddress, // Makes the keyboard easier for emails
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.mail),
                      labelText: "Email Id",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacing between fields

              // Password TextField
              Center(
                child: SizedBox(
                  height: 48,
                  width: 300,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible, // Toggle password visibility
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.lock),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16), // Spacing before the button

              // ElevatedButton for login
              ElevatedButton(
                onPressed:LOGIN, child: Text("LOGIN",),
            
                 
              ),

            ],
          ),
        ),
      ),
    );
  }
}
