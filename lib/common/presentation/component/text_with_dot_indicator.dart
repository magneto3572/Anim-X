import 'package:flutter/material.dart';

class TextWithDotIndicator extends StatelessWidget {
  final String text;
  final bool lastIndex;

  TextWithDotIndicator(this.text, this.lastIndex);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
         if(lastIndex)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 5.0,
            height: 5.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
      ],
    );
  }
}