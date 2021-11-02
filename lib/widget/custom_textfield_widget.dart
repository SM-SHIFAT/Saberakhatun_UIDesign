import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? textInputType;
  final String? labelText;
  final TextEditingController? controller;
  final IconData? icon;
  final String? Function(String?)? validator;
  final GlobalKey<FormState> formKey;

  const CustomTextField(
      {Key? key,
      required this.textInputType,
      required this.labelText,
      this.controller,
      required this.icon,
      required this.validator,
      required this.formKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.amber,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.blueGrey,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.amber,
              width: 2,
            ),
          ),
          // border: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.amber, width: 2),
          //     borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: labelText,
        ),
      ),
    );
  }
}
