import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/drawer/navDrawer.dart';
import 'package:internship_management_system/screens/bottomNavBar/bottomNavBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class applicationDetailsScreen extends StatefulWidget {
  static String routeName = "/applicationDetailsScreen";
  final Map<String, dynamic> data;

  applicationDetailsScreen({required this.data});

  @override
  _applicationDetailsScreenState createState() => _applicationDetailsScreenState();
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
  late int idStage ;
  late UserProvider userProvider;

  void modifyAccount(String idStage, String theme,String resEmail,String resFirstName,String resLastName,String entrName,String adrs,
      String tel) async {
    Uri url = Uri.parse(modifyApplication);
    var response = await http.post(url,
        body: {'id': idStage,
          "theme": theme,
          "dateD":"10-02-10",
          "dateF":"10-02-20",
          "duree":"10",
          "description":"test",
          "deadline":"10-02-20",
          "tel":tel,
          "adrs":adrs,
          "resLastName":resLastName,
          "resFirstName":resFirstName,
          "resEmail":resEmail,
          "entrName":entrName
           });

    if (response.statusCode == 200) {
      if(widget.data['etat_responsable']=="refuse" ||widget.data['etat_chef']!="accepte" ){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.check_circle, color: Colors.green,size: 30,),
                  SizedBox(height: 10),
                  Text('App information updated successfully'),
                ],
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
      else {
        // Handle error ca
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
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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
    resEmailController=TextEditingController(text: widget.data['email']);
    resFirstNameController=TextEditingController(text: widget.data['prenom_responsable']);
    resLastNameController=TextEditingController(text: widget.data['nom_responsable']);
    entrNameController=TextEditingController(text: widget.data['nom_entreprise']);
    adrsController=TextEditingController(text: widget.data['addresse_entreprise']);
    telController=TextEditingController(text: widget.data['tel_entreprise'].toString());

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
          child: Column(
            children: [
              Text('application information', style: GoogleFonts.poppins(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),),
              SizedBox(height: 15.0),
              TextField(
                controller: themeController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'theme',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: resEmailController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'supervisor email',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: resFirstNameController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'supervisor first name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: resLastNameController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'supervisor last name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller:entrNameController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'company name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: adrsController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'company address',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: telController,
                enabled: widget.data['createur'] == "etudiant",
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'company phone',
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    idStage = widget.data['id_stage'];
                    print(idStage);
                    modifyAccount(idStage.toString(),themeController.text,resEmailController.text,
                        resFirstNameController.text,resLastNameController.text,entrNameController.text,adrsController.text,telController.text);
                  },
                  child: Text('Update'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
