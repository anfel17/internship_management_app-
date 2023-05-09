import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:internship_management_system/dialog/my_dialog.dart';
import 'package:internship_management_system/screens/myProfile/profile_screen.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  static String routeName = "/UpdateProfileScreen";
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String userId = '';
  late UserProvider userProvider;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController diplomaController = TextEditingController();
  TextEditingController registerNumberController = TextEditingController();
  TextEditingController departementController = TextEditingController();
  TextEditingController specialityController = TextEditingController();

  Future<void> getStudentAccount(String userId) async {
    Uri url = Uri.parse(consultStudentAccount);
    var response = await http.post(url, body: {'id': userId});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        firstNameController.text = data[0]['nom_etudiant'];
        lastNameController.text = data[0]['prenom_etudiant'];
        emailController.text = data[0]['email'];
        diplomaController.text = data[0]['diplome'];
        specialityController.text = data[0]['specialite'];
        birthPlaceController.text = data[0]['lieu_naissance'];
        birthDateController.text= data[0]['date_naissance'];
        phoneController.text = data[0]['tel_etudiant'].toString();
        registerNumberController.text = data[0]['num_carte'].toString();
      });
    } else {
      print("error");
    }
  }

  void modifyAccount(
      String name,
      String lastname,
      String email,
      String birthPlace,
      String diplome,
      String specialite,
      String tel,
      String cardNumber,
      String birthDate) async {
    // Call the modifyStudentAccount API endpoint with the updated name value
    Uri url = Uri.parse(modifyStudentAccount);
    var response = await http.post(url, body: {
      'id': userId,
      'email': email,
      'firstName': name,
      'lastName': lastname,
      "currentPassword": "0000",
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'tel': tel,
      'cardNumber': cardNumber,
      'diplome': diplome,
      'specialite': specialite
    });

    if (response.statusCode == 200) {
      MyDialog.show(
        context,
        'profile updated successfuly',
        '',
        DialogType.success,
        () {
          Navigator.pushNamed(context, ProfileScreen.routeName);
        },
      );
    } else {
      // Handle error case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update account information'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userId = userProvider.userId;
    getStudentAccount(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15.0),
              TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),

              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: birthPlaceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'birth place',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: birthDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birth date',
                ),
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: diplomaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Diploma',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: registerNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registration Number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              TextFormField(
                controller: specialityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'speciality',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'this field is required';
                  }
                },
              ),
              SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      modifyAccount(
                          firstNameController.text,
                          lastNameController.text,
                          emailController.text,
                          birthPlaceController.text,
                          diplomaController.text,
                          specialityController.text,
                          phoneController.text,
                          registerNumberController.text,
                          birthDateController.text);
                    }
                  },
                  child: Text('Update'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
