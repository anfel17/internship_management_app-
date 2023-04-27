import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  static String routeName = "/UpdateProfileScreen";
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  TextEditingController firstNameController = TextEditingController(text: 'anfel');
  TextEditingController lastNameController = TextEditingController(text: 'kasmi');
  TextEditingController emailController = TextEditingController(text: 'anfel.kasmi@univ-constantine2.dz');
  TextEditingController phoneController = TextEditingController(text: '0653402335');
  TextEditingController birthDateController = TextEditingController(text: '17-02-2003');
  TextEditingController addressController = TextEditingController(text: 'constantine');
  TextEditingController diplomaController = TextEditingController(text: 'informatique');
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [ TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'First Name',
              ),
            ),
              SizedBox(height: 15.0),
              TextField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last Name',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registration Number',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: birthDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Birth date',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: diplomaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Diploma',
                ),
              ),
              SizedBox(height: 15.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Registration Number',
                ),
              ),
              SizedBox(height: 15.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {  },
                  child: Text('Update'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),

                ),
              ),
            ],
          ),
        )

    );
  }
}
