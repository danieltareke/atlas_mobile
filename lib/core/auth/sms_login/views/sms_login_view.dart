import 'package:atlas/core/auth/sms_login/views/sms_login_verification_view.dart';
import 'package:atlas/core/auth/widgets/user_agreement_button.dart';
import 'package:atlas/widgets/buttons.dart';
import 'package:atlas/widgets/phone_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SmsLoginView extends StatefulWidget {
  const SmsLoginView({Key? key}) : super(key: key);

  @override
  _SmsLoginViewState createState() => _SmsLoginViewState();
}

class _SmsLoginViewState extends State<SmsLoginView> {
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
          'Sign In',
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sign In with SMS verification code',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'We will send you ONE time SMS message.',
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      _phoneNumberfield(),
                      _nextButton(context),
                      TextButton(
                        onPressed: () =>
                            {Navigator.pushNamed(context, '/login')},
                        child: Text('Sign In with a password'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 90,
                  ),
                  UserAgreementButton(msg: 'Next')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _phoneNumberfield() {
    return AtlasPhoneSelector(
      hintText: 'Phone',
      initialCountry: 'US',
      onChange: (phone) {
        phoneController.text = phone.completeNumber;
        print(phone.completeNumber);
      },
    );
  }

  Widget _nextButton(BuildContext context) {
    return AtlasElevatedButton(
      buttonTitle: "Next",
      onSubmit: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (phoneController.value.text.length > 0) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text('Processing Data' + phoneController.value.text)),
          );

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SmsVerificationView(
                      phoneNum: phoneController.text,
                    )),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
