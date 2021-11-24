import 'package:flutter/material.dart';

class AtlasPasswordFormField extends StatefulWidget {
  final TextEditingController myController;
  final String hint;
  late bool obscureText;
  final TextInputType textInputType;

  AtlasPasswordFormField(
      {Key? key,
      required this.myController,
      required this.hint,
      this.obscureText = true,
      required this.textInputType})
      : super(key: key);

  @override
  _AtlasPasswordFormFieldState createState() => _AtlasPasswordFormFieldState();
}

class _AtlasPasswordFormFieldState extends State<AtlasPasswordFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: TextFormField(
        controller: widget.myController,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        style: TextStyle(fontSize: 18.0, color: Colors.deepPurple),
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white70,
          suffixIcon: IconButton(
            icon: Icon(
                widget.obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
          ),
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
