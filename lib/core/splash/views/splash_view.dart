import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text("Login"),
            onPressed: () => {Navigator.pushNamed(context, '/login')},
          ),
          OutlinedButton(
            child: Text("Register"),
            onPressed: () => {Navigator.pushNamed(context, '/register')},
          )
        ],
      ),
    );
  }
}
