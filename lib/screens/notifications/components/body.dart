import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  List<dynamic> data = [];

  Future<void> getStudentAccount() async {
    Uri url = Uri.parse(getStudentNotif);
    var response = await http.post(url, body: {'id': '1'});
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
      });
    } else {
      print("error");
    }
  }

  @override
  void initState() {
    super.initState();
    getStudentAccount();
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
                    subtitle: Text(data[index]['time'] ?? ''),
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
