import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class Body extends StatefulWidget {
  @override
  State<Body> createState() => BodyState();
}

class BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateDebController = TextEditingController();
  final TextEditingController _dateFinController = TextEditingController();
  late DateTime today;
  DateTime? _selectedDate;

  @override
  void initState() {
  super.initState();
  today = DateTime.now();
  _selectedDate = today;
  }

  void _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: today,
        lastDate: DateTime(2101));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView( child: Column(children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "Create New Application",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                    decoration: InputDecoration(
                  labelText: 'supervisor first name',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Sets border radius
                  ),
                )),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: "supervisor last name ",
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                    decoration: InputDecoration(
                  labelText: 'supervisor email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(20.0), // Sets border radius
                  ),
                )),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'company name',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'company phone',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 15.0),

                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'company address',
                    border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.circular(20.0), // Sets border radius
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _dateDebController,
                        decoration: InputDecoration(
                          labelText: 'start date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onTap: () {
                          _selectDate(context, _dateDebController);
                        },
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        controller: _dateFinController,
                        decoration: InputDecoration(
                          labelText: 'end date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onTap: () {
                          _selectDate(context, _dateFinController);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.0),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, submit it here
                    }
                  },
                  child: Text('Submit'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                  ),

                )],
            ),
          ),
        )
      ])),
    );
  }
}
