import 'package:e_commerence_store_ui/utils/app_colors.dart';
import 'package:e_commerence_store_ui/utils/media_query.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

enum TextFieldType { Email, Password, Username }

class CustomTextField extends StatefulWidget {
  final String heading;
  final TextFieldType fieldType;
  final String hinttext;

  CustomTextField({
    required this.heading,
    required this.fieldType,
    required this.hinttext,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  String? _errorMessage;
  // ignore: unused_field
  late String _inputValue;
  bool _showSuffixIcon = false;

  void _validateInput(String value) {
    setState(() {
      switch (widget.fieldType) {
        case TextFieldType.Email:
          _errorMessage = _validateEmail(value);
          break;
        case TextFieldType.Password:
          _errorMessage = _validatePassword(value);
          break;
        case TextFieldType.Username:
          _errorMessage = _validateUsername(value);
          break;
      }
      _inputValue = value;
      _showSuffixIcon = _errorMessage == null && _isValidationMet(value);
    });
  }

  String? _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (value.isEmpty) {
      AppConstants.email = false;
      return 'Email is required';
    } else if (!emailRegex.hasMatch(value)) {
      AppConstants.email = false;
      return 'Invalid email format';
    }
    AppConstants.email = true;
    AppConstants.emailGiven = value;
    return null;
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      AppConstants.password = false;
      return 'Password is required';
    } else if (value.length < 8) {
      AppConstants.password = false;
      return 'Password must be at least 8 characters long';
    }
    AppConstants.passwordGiven = value;
    AppConstants.password = true;
    return null;
  }

  String? _validateUsername(String value) {
    if (value.isEmpty) {
      AppConstants.username = false;
      return 'Username is required';
    } else if (value.length < 5) {
      AppConstants.username = false;
      return 'Username must be at least 5 characters long';
    }
    AppConstants.usernameGiven = value;
    AppConstants.username = true;

    return null;
  }

  bool _isValidationMet(String value) {
    switch (widget.fieldType) {
      case TextFieldType.Email:
        return _validateEmail(value) == null;
      case TextFieldType.Password:
        return _validatePassword(value) == null;
      case TextFieldType.Username:
        return _validateUsername(value) == null;
    }
  }

  @override
  void initState() {
    super.initState();
    _inputValue = '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputValue = '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyle(
            fontSize: GetScreenSize.getScreenWidth(context) * 0.035,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(104, 107, 110, 1),
          ),
        ),
        TextField(
          onChanged: _validateInput,
          obscureText: widget.fieldType == TextFieldType.Password,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.appGreyText,
            ),
            border: const UnderlineInputBorder(),
            errorText: _errorMessage,
            suffixIcon: _showSuffixIcon
                ? Icon(
                    Icons.check,
                    color: AppColors.switchGreen,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}

// import 'package:e_commerence_store_ui/utils/media_query.dart';
// import 'package:flutter/material.dart';

// import '../utils/app_constants.dart';

// enum TextFieldType { Email, Password, Username }

// class CustomTextField extends StatefulWidget {
//   final String heading;
//   final TextFieldType fieldType;
//   final String hinttext;
//   final TextEditingController controller;

//   CustomTextField({
//     required this.heading,
//     required this.fieldType,
//     required this.hinttext,
//     required this.controller,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
// }

// class _CustomTextFieldState extends State<CustomTextField> {
//   String? _errorMessage;
//   // ignore: unused_field
//   late String _inputValue;
//   bool _showSuffixIcon = false;

//   void _validateInput(String value) {
//     setState(() {
//       switch (widget.fieldType) {
//         case TextFieldType.Email:
//           _errorMessage = _validateEmail(value);
//           break;
//         case TextFieldType.Password:
//           _errorMessage = _validatePassword(value);
//           break;
//         case TextFieldType.Username:
//           _errorMessage = _validateUsername(value);
//           break;
//       }
//       _inputValue = value;
//       _showSuffixIcon = _errorMessage == null && _isValidationMet(value);
//     });
//   }

//   String? _validateEmail(String value) {
//     final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
//     if (value.isEmpty) {
//       AppConstants.email = false;
//       return 'Email is required';
//     } else if (!emailRegex.hasMatch(value)) {
//       AppConstants.email = false;
//       return 'Invalid email format';
//     }
//     AppConstants.email = true;
//     AppConstants.emailGiven = value;
//     return null;
//   }

//   String? _validatePassword(String value) {
//     if (value.isEmpty) {
//       AppConstants.password = false;
//       return 'Password is required';
//     } else if (value.length < 8) {
//       AppConstants.password = false;
//       return 'Password must be at least 8 characters long';
//     }
//     AppConstants.passwordGiven = value;
//     AppConstants.password = true;
//     return null;
//   }

//   String? _validateUsername(String value) {
//     if (value.isEmpty) {
//       AppConstants.username = false;
//       return 'Username is required';
//     } else if (value.length < 5) {
//       AppConstants.username = false;
//       return 'Username must be at least 5 characters long';
//     }
//     AppConstants.usernameGiven = value;
//     AppConstants.username = true;

//     return null;
//   }

//   bool _isValidationMet(String value) {
//     switch (widget.fieldType) {
//       case TextFieldType.Email:
//         return _validateEmail(value) == null;
//       case TextFieldType.Password:
//         return _validatePassword(value) == null;
//       case TextFieldType.Username:
//         return _validateUsername(value) == null;
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _inputValue = '';
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _inputValue = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.heading,
//           style: TextStyle(
//             fontSize: GetScreenSize.getScreenWidth(context) * 0.035,
//             fontWeight: FontWeight.w400,
//             color: Color.fromRGBO(104, 107, 110, 1),
//           ),
//         ),
//         TextField(
//           controller: widget.controller,
//           onChanged: _validateInput,
//           obscureText: widget.fieldType == TextFieldType.Password,
//           decoration: InputDecoration(
//             hintText: widget.hinttext,
//             hintStyle: const TextStyle(
//               fontWeight: FontWeight.w400,
//               color: Color.fromRGBO(143, 149, 158, 1),
//             ),
//             border: const UnderlineInputBorder(),
//             errorText: _errorMessage,
//             suffixIcon: _showSuffixIcon
//                 ? Icon(
//                     Icons.check,
//                     color: Colors.green,
//                   )
//                 : null,
//           ),
//         ),
//       ],
//     );
//   }
// }
