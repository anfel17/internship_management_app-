import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDialog {
  static void show(
      BuildContext context,
      String title,
      String message,
      DialogType type,
      Function() onOkPressed,
      ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title,style:

          GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF3A96B4),
          ),),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10), // Add some spacing between text and image
              Image.asset('assets/images/Screenshot_2023-06-01_180551-removebg-preview.png'), // Replace with the actual image path
            ],
          ),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF3A96B4)),
                ),
                onPressed: onOkPressed,
              ),
            ),
          ],
        );
      },
    );
  }
}



