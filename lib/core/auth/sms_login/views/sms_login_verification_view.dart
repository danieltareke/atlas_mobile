import 'package:atlas/core/auth/widgets/user_agreement_button.dart';
import 'package:atlas/widgets/buttons.dart';
import 'package:atlas/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmsVerificationView extends StatefulWidget {
  final String phoneNum;
  SmsVerificationView({Key? key, required this.phoneNum}) : super(key: key);

  @override
  _SmsVerificationViewState createState() => _SmsVerificationViewState();
}

class _SmsVerificationViewState extends State<SmsVerificationView> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final verificationCodeController = TextEditingController();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verify',
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Please type the verification code we sent you to ' +
                          widget.phoneNum,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  _verificationCodeField(),
                  _sizedBoxVertical(),
                  _sizedBoxVertical(),
                  _confirmButton(),
                  _sizedBoxVertical(),
                  TextButton(
                    onPressed: () {},
                    child: Text('Resend'),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  UserAgreementButton(msg: 'Verify')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizedBoxVertical() {
    return SizedBox(height: 10);
  }

  Widget _verificationCodeField() {
    return AtlasTextFormField(
      myController: verificationCodeController,
      hint: "Code",
      textInputType: TextInputType.number,
    );
  }

  Widget _confirmButton() {
    return AtlasElevatedButton(
      buttonTitle: "Verify",
      onSubmit: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    verificationCodeController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
