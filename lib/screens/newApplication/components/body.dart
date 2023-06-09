import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_management_system/dialog/my_dialog.dart';

import '../../../constants.dart';
import '../../home/home_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {

  String userId = '';
  late UserProvider userProvider;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateDebController = TextEditingController();
  final TextEditingController _dateFinController = TextEditingController();
  final TextEditingController supervisorNameController = TextEditingController();
  final TextEditingController supervisorLastNameController = TextEditingController();
  final TextEditingController supervisorEmailController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController companyPhoneController = TextEditingController();
  final TextEditingController companyAddressController = TextEditingController();
  final TextEditingController themeController = TextEditingController();

  late DateTime today;
  DateTime? _selectedDate;



  void _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> createNewApplication(String userId,String resFirstName,String resLastName,
      String resEmail,String entrName,String tel,String adrs,String dateD,
      String dateF,String theme,String duree) async {
    Uri url = Uri.parse(createApplication);
    var response = await http.post(url, body: {'idStudent': userId,
      "dateD":dateD,
      "dateF":dateF,
      "theme":theme,
      "duree":"duree",
      "deadline":"10-02-20",
      "resFirstName":resFirstName,
      "resLastName":resLastName,
      "resEmail":resEmail,
      "entrName":entrName,
      "tel":tel,
      "adrs":adrs,
    });

    if (response.statusCode == 200) {
      // Handle success case
      MyDialog.show(
        context,
        'request sent successfuly',
        '',
        DialogType.success,
            () {
          Navigator.pushNamed(context, HomeScreen.routeName);
        },
      );
    } else {
      // Handle error case
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to sent request'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    today = DateTime.now();
    _selectedDate = today;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView( child: Column(children: [
         Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Create New Application",
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
              controller: supervisorNameController,

                    decoration: InputDecoration(
                  labelText: 'supervisor first name',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Sets border radius
                  ),
                )),
                SizedBox(height: 10.0),
                TextFormField(
                  controller :supervisorLastNameController,
                  decoration: InputDecoration(
                    labelText: "supervisor last name ",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                    controller :supervisorEmailController,
                    decoration: InputDecoration(
                  labelText: 'supervisor email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Sets border radius
                  ),
                )),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: companyNameController,
                  decoration: InputDecoration(
                    labelText: 'company name',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller:companyPhoneController,
                  decoration: InputDecoration(
                    labelText: 'company phone',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 10.0),

                TextFormField(
                  controller: companyAddressController,
                  decoration: InputDecoration(
                    labelText: 'company address',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: themeController,
                  decoration: InputDecoration(
                    labelText: 'theme',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dateDebController,
                        decoration: InputDecoration(
                          labelText: 'start date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onTap: () {
                          _selectDate(context, _dateDebController);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: _dateFinController,
                        decoration: InputDecoration(
                          labelText: 'end date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onTap: () {
                          _selectDate(context, _dateFinController);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userProvider = Provider.of<UserProvider>(context, listen: false);
                      userId = userProvider.userId;
                      createNewApplication(userId,supervisorNameController.text,supervisorLastNameController.text,
                          supervisorEmailController.text,companyNameController.text,companyPhoneController.text,companyAddressController.text,
                          _dateDebController.text,_dateFinController.text,
                          themeController.text,themeController.text);
                    }
                  },
                  child: Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),

                )],
            ),
          ),
        )
      ])),
    );
  }
}
