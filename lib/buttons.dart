import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttontapped;

  const button(
      {this.color, this.buttontext = '', this.textcolor, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(
                  color: textcolor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
