import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AnimatedText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TyperAnimatedTextKit(
      text: ["READLY"],
      textStyle: TextStyle(
        color: Colors.grey,
        fontStyle: FontStyle.italic,
        fontSize: 24,
      ),
      speed: Duration(milliseconds: 100), // Speed of character appearance
    );
  }
}
