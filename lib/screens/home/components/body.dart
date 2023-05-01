import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:internship_management_system/screens/newApplication/newApplication.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  List<dynamic> data = [];
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    String myUrl = consultOffersList;
    http.Response response = await http.get(Uri.parse(myUrl));
    setState(() {
      data = json.decode(response.body);
      print(data);
    });
  }

  @override
  void _submitSearch(String value) {
    print("Search for $value");
  }

  final TextEditingController _searchController = TextEditingController();

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
              Row(
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
            Text(
                'Internships List',
               style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, i) {
                    return Column(
                      children: [
                        Card(
                          color: Colors.lightBlue[50],
                          elevation: 10,
                          child: ExpansionTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[i]['theme']),
                                SizedBox(height: 5),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Text("duree: ${data[i]['duree']}"),
                              ],
                            ),
                            children: [
                              ListTile(
                                title: Text(data[i]['description']),
                              ),
                            ],
                          ),
                        ),
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
