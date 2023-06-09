import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        print(data);
      });
    } else {
      print("error");
    }
  }

  Future<void> delete(String id) async {
    Uri url = Uri.parse(deleteNotification);
    var response = await http.post(url, body: {'id': id});
    if (response.statusCode == 200) {
      setState(() {
        print('working');
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
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 18,
                backgroundImage: AssetImage('assets/images/notification.png'),
              ),
              SizedBox(width: 10),
              Text(
                'Notifications',
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Slidable(
                    key: ValueKey(0),
                    endActionPane: ActionPane(
                      motion: StretchMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                        await delete(data[index]['id_notification'].toString());
                        setState(() {
                          data.removeAt(index);
                        });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete_forever,
                          label: 'delete',
                        ),
                      ],),
                    child: Card(
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
                        child: ListTile(
                          title: Text(data[index]['message'] ?? ''),
                          subtitle: Text(DateFormat.yMMMMd().format(
                              DateTime.parse(data[index]['timeStamp']))),
                          leading: Icon(Icons.notifications),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

