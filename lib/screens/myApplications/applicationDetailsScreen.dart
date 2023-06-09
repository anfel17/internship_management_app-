import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:internship_management_system/dialog/my_dialog.dart';

import 'myApplication_screen.dart';

class applicationDetailsScreen extends StatefulWidget {
  static String routeName = "/applicationDetailsScreen";
  final Map<String, dynamic> data;

  applicationDetailsScreen({required this.data});

  @override
  _applicationDetailsScreenState createState() =>
      _applicationDetailsScreenState();
}

class _applicationDetailsScreenState extends State<applicationDetailsScreen> {
  late TextEditingController themeController;
  late TextEditingController descriptionController;
  late TextEditingController resFirstNameController;
  late TextEditingController resLastNameController;
  late TextEditingController resEmailController;
  late TextEditingController entrNameController;
  late TextEditingController adrsController;
  late TextEditingController telController;
  late TextEditingController dateDebController;
  late TextEditingController dateFinController;

  late int idStage;
  late UserProvider userProvider;
  final _formKey = GlobalKey<FormState>();

  void modifyAccount(
      String idStage,
      String theme,
      String resEmail,
      String resFirstName,
      String resLastName,
      String entrName,
      String adrs,
      String tel,
      String dateD,
      String dateF) async {
    Uri url = Uri.parse(modifyApplication);
    var response = await http.post(url, body: {
      'id': idStage,
      "theme": theme,
      "dateD": dateD,
      "dateF": dateF,
      "duree": "10",
      "description": "test",
      "deadline": "10-02-20",
      "tel": tel,
      "adrs": adrs,
      "resLastName": resLastName,
      "resFirstName": resFirstName,
      "resEmail": resEmail,
      "entrName": entrName
    });

    if (response.statusCode == 200) {
      if (widget.data['etat_responsable'] == "refuse" ||
          widget.data['etat_chef'] != "accepte") {
        MyDialog.show(
          context,
          'information updated successfuly',
          '',
          DialogType.success,
              () {
            Navigator.pushNamed(context, ApplicationScreen.routeName);
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Failed'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cancel, color: Colors.red, size: 30),
                  SizedBox(height: 5),
                  Text('request already accepted by the chef'),
                ],
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    themeController = TextEditingController(text: widget.data['theme']);
    resEmailController = TextEditingController(text: widget.data['email']);
    resFirstNameController =
        TextEditingController(text: widget.data['prenom_responsable']);
    resLastNameController =
        TextEditingController(text: widget.data['nom_responsable']);
    entrNameController =
        TextEditingController(text: widget.data['nom_entreprise']);
    adrsController =
        TextEditingController(text: widget.data['addresse_entreprise']);
    telController =
        TextEditingController(text: widget.data['tel_entreprise'].toString());
    dateDebController = TextEditingController(text: widget.data['date_debut'].toString());
    dateFinController = TextEditingController(text: widget.data['date_fin'].toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3A96B4),
        title: Container(
          width: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text("Internify"),
        ),
      ),
      drawer: NavDrawer(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(
                  'application information',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: themeController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'theme',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: resEmailController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'supervisor email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: resFirstNameController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'supervisor first name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: resLastNameController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'supervisor last name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: entrNameController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'company name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: adrsController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'company address',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  controller: telController,
                  enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'company phone',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),

                  TextFormField(
                  controller: dateDebController,
                  // enabled: widget.data['createur'] == "etudiant",
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'start date',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this field is required';
                    }
                  },
                ),
                SizedBox(height: 15.0),
                  TextFormField(
                    controller: dateFinController,
                    // enabled: widget.data['createur'] == "etudiant",
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'end date',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'this field is required';
                      }
                    },
                  ),
                // SizedBox(height: 15.0),
                // TextFormField(
                //    enabled: false,
                //   decoration: InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: widget.data['motif'] ,
                //   ),
                // ),

                SizedBox(height: 15.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        idStage = widget.data['id_stage'];
                        print(idStage);
                        modifyAccount(
                            idStage.toString(),
                            themeController.text,
                            resEmailController.text,
                            resFirstNameController.text,
                            resLastNameController.text,
                            entrNameController.text,
                            adrsController.text,
                            telController.text,
                            dateDebController.text,
                            dateFinController.text);
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
          ),
        ),
      ),
        bottomNavigationBar: MyBottomNavigationBar(selectedIndex: 0)
    );
  }
}

