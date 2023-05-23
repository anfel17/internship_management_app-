import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/login/Background.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:internship_management_system/screens/home/home_screen.dart';

import '../../constants.dart';
import '../../provider/user.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/LoginPage";
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void Login() async {
      final String myUrl = login;
      final response = await http.post(
        Uri.parse(myUrl),
        body: {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final String token = data['authorisation']['token'];
        final Map<String, dynamic> user = data['user'];
        final String userId = user['id_etudiant'].toString();

        final userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.userId = userId;

        // Navigate to the home page
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        final String message = response.body;
        // Show an error message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
          ),
        );
      }
    }

    return Scaffold(
      body: Background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "LOGIN",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF276887),
                    fontSize: 36
                ),
                textAlign: TextAlign.left,
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: FormField<String>(
                builder: (FormFieldState<String> state) {
                  return TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Username",
                      errorText: state.hasError ? state.errorText : null,
                    ),
                    onChanged: (value) {
                      state.didChange(value);
                    },
                  );
                },
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: size.height * 0.03),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password"
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
            ),


            SizedBox(height: size.height * 0.05),

            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (EmailValidator.validate(_emailController.text) &&
                      _passwordController.text.isNotEmpty) {
                    // valid email and non-empty password
                    Login();
                  } else {
                    // show error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Invalid email or password'),
                      ),
                    );
                  }
                },

               style: ButtonStyle( elevation: MaterialStateProperty.all(0), backgroundColor: MaterialStateProperty.all(Colors.transparent),),

                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: size.width * 0.5,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
                            colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ]
                        )
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

