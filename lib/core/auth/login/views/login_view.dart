import 'package:atlas/widgets/buttons.dart';
import 'package:atlas/widgets/password_form_field.dart';
import 'package:atlas/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();

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
                  'Sign In',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(color: Colors.blueAccent),
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  'Login with a password',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 150,
                ),
                _userNameField(),
                _sizedBoxVertical(),
                _passwordField(),
                _sizedBoxVertical(),
                _sizedBoxVertical(),
                _signInButton(),
                _sizedBoxVertical(),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Login with SMS verification code'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {},
                  child: Text('Login with a password'),
                ),
                SizedBox(
                  height: 40,
                ),
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

  Widget _userNameField() {
    return AtlasTextFormField(
      myController: userController,
      hint: "Phone/ID/Email",
      textInputType: TextInputType.name,
    );
  }

  Widget _passwordField() {
    return AtlasPasswordFormField(
      myController: passwordController,
      hint: "Password",
      obscureText: true,
      textInputType: TextInputType.visiblePassword,
    );
  }

  Widget _signInButton() {
    return AtlasElevatedButton(
      buttonTitle: "Sign In",
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
    userController.dispose();
    passwordController.dispose();
    userController.dispose();
    super.dispose();
  }
}
