import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  static String routeName = "/UpdateProfileScreen";
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {

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
        lastNameController.text =  data[0]['prenom_etudiant'];
        emailController.text =  data[0]['email'];
        diplomaController.text =data[0]['diplome'];
        specialityController.text =  data[0]['specialite'];
        birthPlaceController.text = data[0]['lieu_naissance'];
        phoneController.text = data[0]['tel_etudiant'].toString();
        registerNumberController.text = data[0]['num_carte'].toString();


      });
    } else {
      print("error");
    }
  }
  void modifyAccount(String name,String lastname,String email,String birthPlace,
      String diplome,String specialite,String tel,String cardNumber) async {
    // Call the modifyStudentAccount API endpoint with the updated name value
    Uri url = Uri.parse(modifyStudentAccount);
    var response = await http.post(url,
        body: {'id': userId,
          'email': email,
          'firstName': name,
          'lastName': lastname,
          "currentPassword":"0000",
          "birthDate":"20-02-21",
          'birthPlace':birthPlace,
          'tel':tel,
          'cardNumber':cardNumber,
          'diplome':diplome,
          'specialite':specialite});

    if (response.statusCode == 200) {
      // Handle success case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Account information updated successfully'),
        ),
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
          child: Column(
            children: [
              SizedBox(height: 15.0),
              TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
              SizedBox(height: 15.0),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: birthPlaceController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'birth place',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: birthDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birth date',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: diplomaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Diploma',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: registerNumberController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registration Number',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: specialityController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'speciality',
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    modifyAccount(firstNameController.text,
                        lastNameController.text,
                        emailController.text,
                        birthPlaceController.text,
                        diplomaController.text,
                        specialityController.text,
                        phoneController.text,
                        registerNumberController.text

                        );
                  },
                  child: Text('Update'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
