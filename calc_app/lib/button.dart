// For making the buttons ...
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton(
      {super.key,
      required this.btncolor,
      required this.btntxt,
      required this.txtcolor,
      required this.btntapped});

  final Color btncolor;
  final Color txtcolor;
  final String btntxt;
  final dynamic btntapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: btntapped,
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: btncolor,
            child: Center(
              child: Text(
                btntxt,
                style: TextStyle(
                  color: txtcolor,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
