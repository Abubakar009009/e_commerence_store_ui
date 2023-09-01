import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/media_query.dart';

class OtpContainer extends StatelessWidget {
  const OtpContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GetScreenSize.getScreenWidth(context) * 0.15,
      height: GetScreenSize.getScreenWidth(context) * 0.19,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white, // Set the default box color here
      ),
      child: SizedBox(
        height: GetScreenSize.getScreenWidth(context) * 0.15,
        width: GetScreenSize.getScreenWidth(context) * 0.15,
        child: TextFormField(
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          style: Theme.of(context).textTheme.headlineLarge,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
          cursorHeight: 30,
          decoration: InputDecoration(
            border: InputBorder.none, // Hide the default underline
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.black, // Set the border color when focused
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
