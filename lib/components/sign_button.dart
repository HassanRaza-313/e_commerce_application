import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  final void Function() onPressed;
  Button({super.key,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
        ),
        child: Text(text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}