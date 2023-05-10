import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:internship_management_system/screens/myApplications/applicationDetailsScreen.dart';
import 'dart:convert';
import '../../../constants.dart';
import 'package:internship_management_system/provider/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}


class BodyState extends State<Body> {

  List<dynamic> data = [];
  String userId = '';
  late UserProvider userProvider;

  Future<void> listOfApplications(String userId) async {
    Uri url = Uri.parse(applicationsList);
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
    listOfApplications(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
            'Applications',
            style: GoogleFonts.poppins(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      color: Colors.lightBlue[50],
                      elevation: 8,
                      child: ListTile(
                        title: Text(data[index]['theme'],style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400)),
                        subtitle: data[index]['motif'] != null
                            ? Text('check your motif',style: TextStyle(color: Colors.red,),)
                            : null,
                        trailing: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                        //    border: Border.all(color: Colors.grey),
                            color: data[index]['status'] == 'accepted' ? Colors.green :
                            data[index]['status'] == 'pending' ? Colors.grey :
                            data[index]['status'] == 'refused' ? Colors.red : Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          child: Text(
                            data[index]['status'],
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                        leading: Icon(Icons.badge),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => applicationDetailsScreen(
                                data: data[index],
                              ),
                            ),
                          );
                        },
                      ),
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
