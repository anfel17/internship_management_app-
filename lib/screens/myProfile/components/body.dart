import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:internship_management_system/screens/updateProfile/update_profile_screen.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  String name = "";
  String img = "";
  String email = "";
  String diplome = "";
  String specialite = "";
  int tel_etudiant = 0;
  int num_carte = 0;
  DateTime date_naissance = DateTime(2023, 5, 15);
  String lieu_naissance = "";
  String nom_departement = "";
  String userId = '';

  late UserProvider userProvider;

  Future<void> getStudentAccount(String userId) async {
    Uri url = Uri.parse(consultStudentAccount);
    var response = await http.post(url, body: {'id': userId});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        name = data[0]['nom_etudiant'] + ' ' + data[0]['prenom_etudiant'];
        email = data[0]['email'];
        diplome = data[0]['diplome'];
        specialite = data[0]['specialite'];
        tel_etudiant = data[0]['tel_etudiant'];
        num_carte = data[0]['num_carte'];
        lieu_naissance = data[0]['lieu_naissance'];
        // date_naissance = data[0]['date_naissance'];
        nom_departement = data[0]['nom_departement'];
        String imagePath = data[0]['photo_etudiant'];
        img = 'http://192.168.1.12:8000/' + imagePath;
        print(img);
      });
    } else {
      print("error");
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
    //  String formattedDate = DateFormat('yyyy-MM-dd').format(date_naissance);
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xFF276887),
          Color(0xFF276887),
          Colors.blue.shade400,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    CircleAvatar(
                      radius: 52,
                      backgroundImage: AssetImage(
                          'assets/images/cheerful-student-posing-against-pink-wall-fotor-bg-remover-20230601152110.png'),
                    ),

                  ]),
                  // FloatingActionButton(
                  //   onPressed: () async {
                  //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  //     // do something with the picked file
                  //   },
                  //   child: Icon(Icons.add),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    email,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 340,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(171, 171, 171, .7),
                                  blurRadius: 20,
                                  offset: Offset(0, 10)),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.credit_card),
                                        Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors
                                                          .grey.shade200)),
                                            ),
                                            child: Text(
                                                'Register Number: ${num_carte.toString()}',
                                                style:
                                                    TextStyle(fontSize: 18))),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200)),
                                          ),
                                          child: Text(
                                              'phone: ${tel_etudiant.toString()}',
                                              style: TextStyle(fontSize: 18)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.place),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200)),
                                          ),
                                          child: Text(
                                            'birth place: $lieu_naissance',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.school),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200)),
                                          ),
                                          child: Text(
                                            'diploma: $diplome',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.school),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200)),
                                          ),
                                          child: Text(
                                            'speciality: $specialite',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.cabin),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color:
                                                        Colors.grey.shade200)),
                                          ),
                                          child: Text(
                                            'departement: $nom_departement',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                               child:
                                ElevatedButton(
                                  style:ButtonStyle( elevation: MaterialStateProperty.all(0), backgroundColor: MaterialStateProperty.all(Colors.transparent),),
                                  child:Container(
                                    alignment: Alignment.center,
                                    height: 40.0,
                                    width: 100,
                                    decoration:  BoxDecoration(
                                        borderRadius: BorderRadius.circular(10.0),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.deepOrangeAccent,
                                              Color.fromARGB(255, 255, 136, 34),
                                              Color.fromARGB(255, 255, 177, 41)
                                            ]
                                        )
                                    ),
                                    child: Text("update",style: TextStyle(color: Colors.white,fontSize: 14),),
                                    padding: const EdgeInsets.all(0),

                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, UpdateProfileScreen.routeName);
                                  },

                                ),
                              ),
                              SizedBox(height: 20,)
                            ],
                          ),
                        ),
                      ],
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
