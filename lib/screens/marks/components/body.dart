import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  int capacite = 0;
  int discipline = 0;
  int attitude = 0;
  int initiative = 0;
  int connaissance = 0;
  int noteTotale = 0;
  String userId = '';
  late UserProvider userProvider;

  Future<void> getStudentmarks(String userId) async {
    Uri url = Uri.parse(checkMarks);
    var response = await http.post(url, body: {'id': userId});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      setState(() {
        capacite = data[0]['capacite'];
        discipline = data[0]['discipline'];
        attitude = data[0]['attitude'];
        initiative = data[0]['initiative'];
        connaissance=data[0]['connaissance'];
        noteTotale = data[0]['note_totale'];
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
    getStudentmarks(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Text(
            'my marks',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: const Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'capacite',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      capacite.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: const Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'discipline',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      discipline.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'attitude',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      attitude.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: const Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'initiative',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      initiative.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'connaissance',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      connaissance.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: 190,
              height: 170,
              padding: EdgeInsets.all(10),
              child: Card(
                elevation: 10,
                shape: const Border(
                  top: BorderSide(
                    color: Color(0xFF276887),
                    width: 7,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'note totale',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Text(
                      noteTotale.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
