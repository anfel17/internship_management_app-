import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  String userId = '';
  late UserProvider userProvider;
  List<dynamic> data = [];

  Future<void> Attendance(String userId) async {
    Uri url = Uri.parse(consultAttendance);
    var response = await http.post(url, body: {'id': userId});

    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        print (data);
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
    Attendance(userId);
  }
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 16.0, top: 16.0),
          child: Row(
            children: [
              Icon(Icons.date_range),
              SizedBox(width: 10),
              Text(
                'Attendance',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          )),
      SizedBox(height: 30),
      Expanded(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 10,
                right: 20,
                left: 20,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 16.0, color: Color(0xFF276887)),
                    ),
                  ),
                  child: ListTile(
                    title: Text(data[index]['date'] ?? '',textAlign: TextAlign.center, style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Row(
                          children:[
                            Icon(Icons.access_time_outlined),
                            Text('Entree:' + data[index]['heure_entree'] ?? '',),
                            SizedBox(width: 10),
                            Icon(Icons.access_time_outlined),
                            Text('Sortie:' + data[index]['heure_entree'] ?? '',),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(data[index]['remarque'] ?? '',),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}
