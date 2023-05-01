import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notifications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 70, // specify the height you want
                  child: ListTile(
                    title: Text(data[index]['message'] ?? ''),
                    subtitle: Text(DateFormat.yMMMMd().format(DateTime.parse(data[index]['timeStamp']))),
                    leading: Icon(Icons.notifications),
                    onTap: () {
                      // Navigate to notification details page
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
