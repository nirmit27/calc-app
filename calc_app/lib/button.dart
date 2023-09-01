// For making the buttons ...
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.btncolor,
      required this.btntxt,
      required this.txtcolor});

  final Color btncolor;
  final Color txtcolor;
  final String btntxt;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: btncolor,
          child: Center(
            child: Text(
              btntxt,
              style: TextStyle(
                color: txtcolor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
