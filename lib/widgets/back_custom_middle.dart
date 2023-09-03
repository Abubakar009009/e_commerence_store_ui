import 'package:flutter/material.dart';

class BackCustomMiddle extends StatelessWidget {
  const BackCustomMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
      ),
    );
  }
}
