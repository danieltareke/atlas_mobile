import 'package:flutter/material.dart';

class AtlasTextFormField extends StatelessWidget {
  final TextEditingController myController;
  final String hint;
  final TextInputType textInputType;

  const AtlasTextFormField(
      {Key? key,
      required this.myController,
      required this.hint,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: TextFormField(
        controller: myController,
        keyboardType: textInputType,
        style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
