import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class AtlasPhoneSelector extends StatelessWidget {
  final String hintText;
  final String initialCountry;
  final void Function(PhoneNumber phone) onChange;
  const AtlasPhoneSelector(
      {Key? key,
      this.hintText = "Phone Number",
      this.initialCountry = 'US',
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
      child: IntlPhoneField(
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
        ),
        initialCountryCode: initialCountry,
        onChanged: onChange,
      ),
    );
  }
}
