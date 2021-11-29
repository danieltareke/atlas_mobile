import 'package:atlas/common/theme/bloc/theme_bloc.dart';
import 'package:atlas/constants/app_constants.dart';
import 'package:atlas/core/settings/user_agreement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeBloc themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OutlinedButton(
            child: Text("Home"),
            onPressed: () => {Navigator.pushReplacementNamed(context, '/home')},
          ),
          OutlinedButton(
            child: Text("Login"),
            onPressed: () => {Navigator.pushNamed(context, '/login')},
          ),
          OutlinedButton(
            child: Text("SMS Login"),
            onPressed: () => {Navigator.pushNamed(context, '/smslogin')},
          ),
          OutlinedButton(
            child: Text("Register"),
            onPressed: () => {Navigator.pushNamed(context, '/register')},
          ),
          OutlinedButton(
            child: Text("Dark Theme"),
            onPressed: () => {
              themeBloc.add(ThemeDarkened()),
            },
          ),
          OutlinedButton(
            child: Text("Light Theme"),
            onPressed: () => {
              themeBloc.add(ThemeLightened()),
            },
          )
        ],
      ),
    );
  }
}
