import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}
class BodyState extends State<Body> {

  List<dynamic> data = [];
  String userId = '';
  late UserProvider userProvider;

  Future<void> getStudentAccount(String userId) async {
    Uri url = Uri.parse(getStudentNotif);
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
    getStudentAccount(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Notifications',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Card(
                    color: Colors.lightBlue[50],
                    elevation: 10,
                    child: ListTile(
                      title: Text(data[index]['message'] ?? ''),
                      subtitle: Text(
                          DateFormat.yMMMMd().format(DateTime.parse(data[index]['timeStamp']))),
                      leading: Icon(Icons.notifications),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    );

  }
}
