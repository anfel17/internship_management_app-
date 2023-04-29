import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {

  final List<String> applications = [
    'Application 1',
    'Application 2',
    'Application 3',
    'Application 4',
    'Application 5',
  ];

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
          const Text(
            'Applications',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: applications.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    // decoration: BoxDecoration(
                    //   border: Border.all(color: Colors.grey[300]!),
                    //   borderRadius: BorderRadius.circular(10),
                    // ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Card(
                      color: Colors.lightBlue[50],
                      elevation: 8,
                      child: ListTile(
                        title: Text(applications[index]),
                        subtitle: Text('Tap to view details'),
                        trailing: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF3A96B4),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 8),
                          child:Text(
                            'refused',
                            style: TextStyle(fontSize: 14,color: Colors.white)
                          )
                        ),
                        leading: Icon(Icons.badge),
                        onTap: () {
                          // Navigate to application details page
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
