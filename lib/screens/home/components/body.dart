import 'dart:convert';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/newApplication/newApplication.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import '../../../provider/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:internship_management_system/dialog/my_dialog.dart';

import '../home_screen.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  String userId = '';
  late UserProvider userProvider;
  late DateTime today;
  DateTime? _selectedDate;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateDebController = TextEditingController();
  final TextEditingController _dateFinController = TextEditingController();
  List<dynamic> data = [];

  List<String> imagePaths = [
    'assets/images/tlc.png',
    'assets/images/newpreview.jpg',
    'assets/images/offre.jpg',
    'assets/images/preview1.jpg',

  ];

  void _selectDate(
      BuildContext context, TextEditingController controller) async {
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

  Future<void> getData() async {
    String myUrl = consultOffersList;
    http.Response response = await http.get(Uri.parse(myUrl));
    setState(() {
      data = json.decode(response.body);
      print(data);
    });
  }

  Future<void> applyforinternship(
      String idOffre, String dateD, String dateF) async {
    Uri url = Uri.parse(applyForInternship);
    var response = await http.post(url, body: {
      'idStudent': userId,
      'idOffre': idOffre,
      'dateD': dateD,
      'dateF': dateF
    });
    if (response.statusCode == 200) {
      MyDialog.show(
        context,
        'Request sent successfully',
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
          content: Text('Failed to update application information'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void _submitSearch(String value) {
    print("Search for $value");
  }

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userId = userProvider.userId;
    today = DateTime.now();
    _selectedDate = today;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
            20,
            20,
            20,
            10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 20,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "Search project",
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => _submitSearch(_searchController.text),
                      child: Container(
                        height: 40,
                        width: 20,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/list.png',
                      width: 25,
                      height: 23,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Internships List',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, i) {
                    return Column(
                      children: [
                        Card(
                            elevation: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.lightBlue[100]!,
                                    Colors.lightBlue[50]!,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: ExpansionTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child:CircleAvatar(
                                    radius: 30,
                                            backgroundImage: AssetImage(
                                              imagePaths[i % imagePaths.length],  // Set the background image based on the index
                                            ),
                                ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          data[i]['theme'],
                                          style: TextStyle(color: Colors.black,fontSize: 17,fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    )
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 5),
                                    Text(
                                      "duree: ${data[i]['duree']}",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                children: [
                                  Form(
                                      key: _formKey,
                                      child: ListTile(
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(data[i]['description']),
                                            SizedBox(height: 10),
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: TextFormField(
                                                    controller:
                                                        _dateDebController,
                                                    decoration:
                                                        const InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.blue),
                                                      ),
                                                      labelText: 'start date',
                                                      labelStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    onTap: () {
                                                      _selectDate(context,
                                                          _dateDebController);
                                                    },
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'this field is required';
                                                      }
                                                    },
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: TextFormField(
                                                    controller:
                                                        _dateFinController,
                                                    decoration:
                                                        const InputDecoration(
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.grey),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.blue),
                                                      ),
                                                      labelText: 'end date',
                                                      labelStyle: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'this field is required';
                                                      }
                                                    },
                                                    onTap: () {
                                                      _selectDate(context,
                                                          _dateFinController);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 30),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton(
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
                                                  child: Text("send request",style: TextStyle(color: Colors.white,fontSize: 14),),
                                                  padding: const EdgeInsets.all(0),

                                                ),
                                                onPressed: () {
                                                  //   print (data[i]['id_offre']);
                                                  if (_formKey.currentState!
                                                      .validate()) {
                                                    applyforinternship(
                                                        data[i]['id_offre']
                                                            .toString(),
                                                        _dateDebController.text,
                                                        _dateFinController
                                                            .text);
                                                  }
                                                },

                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            )),
                        SizedBox(height: 10),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF3A96B4),
            onPressed: () {
              Navigator.pushNamed(context, newApplicationScreen.routeName);
            },
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
