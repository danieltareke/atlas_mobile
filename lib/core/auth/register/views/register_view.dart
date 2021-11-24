import 'package:atlas/widgets/buttons.dart';
import 'package:atlas/widgets/password_form_field.dart';
import 'package:atlas/widgets/phone_selector.dart';
import 'package:atlas/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  @override
  void initState() {
    //hides status bar
    //SystemChrome.setEnabledSystemUIOverlays([]);
    //transparent status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    //display status var
    //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.blueAccent),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _fullNameField(),
                _sizedBoxVertical(),
                _phoneNumberfield(),
                _sizedBoxVertical(),
                _emailField(),
                _sizedBoxVertical(),
                _passwordField(),
                _sizedBoxVertical(),
                _passwordConfirmField(),
                _sizedBoxVertical(),
                _sizedBoxVertical(),
                _signUpButton(),
                _sizedBoxVertical(),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Login with a password'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Login with SMS verification code'),
                ),
                _sizedBoxVertical(),
                _sizedBoxVertical(),
                _sizedBoxVertical(),
                Text(
                    'Click "Sign Up" to indicate that you have read and agreed to the below policy'),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    onPressed: () {},
                    child: Text('Terms of service and privacy policy'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sizedBoxVertical() {
    return SizedBox(height: 10);
  }

  Widget _fullNameField() {
    return AtlasTextFormField(
      myController: nameController,
      hint: "Full name",
      textInputType: TextInputType.name,
    );
  }

  Widget _passwordField() {
    return AtlasPasswordFormField(
      myController: passwordController,
      hint: "Password",
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget _passwordConfirmField() {
    return AtlasPasswordFormField(
      myController: passwordConfirmController,
      hint: "Confirm password",
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget _emailField() {
    return AtlasTextFormField(
      myController: emailController,
      hint: "Email address",
      textInputType: TextInputType.emailAddress,
    );
  }

  Widget _signUpButton() {
    return AtlasElevatedButton(
      buttonTitle: "Sign Up",
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

  Widget _phoneNumberfield() {
    return AtlasPhoneSelector(
      hintText: 'Phone',
      initialCountry: 'US',
      onChange: (phone) {
        emailController.text = phone.completeNumber;
        print(phone.completeNumber);
      },
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
