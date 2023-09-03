import 'package:flutter/material.dart';

class DrawerRow extends StatefulWidget {
  final String imagelink;
  final String text;

  const DrawerRow({required this.imagelink, required this.text, super.key});

  @override
  State<DrawerRow> createState() => _DrawerRowState();
}

class _DrawerRowState extends State<DrawerRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(widget.imagelink, height: 25),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
