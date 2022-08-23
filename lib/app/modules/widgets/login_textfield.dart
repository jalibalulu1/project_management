import 'package:flutter/material.dart';

// ignore: must_be_immutable
class login_textfield extends StatelessWidget {
  final String name;
  final IconData? icon;
  TextEditingController? textEditingController;
  
   login_textfield({
    required this.name,
    required this.icon,
    required this.textEditingController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
       controller:textEditingController ,
      decoration: InputDecoration(
        hintText: name,
        prefixIcon: Align(
          child: Icon(
            icon,
            color: Color(0xFF0288D1),
          ),
          widthFactor: 1.0,
          heightFactor: 1.0,
        ),
        // [enabledBorder], displayed when [TextField, InputDecoration.enabled] is true
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        //[focusedBorder], displayed when [TextField, InputDecorator.isFocused] is true
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0288D1)),
        ),
      ),
      // validator: (value) {
      //   return RegExp(
      //               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      //           .hasMatch(value!)
      //       ? null
      //       : 'Please provide a valid email id';
      // },
    );
  }
}
