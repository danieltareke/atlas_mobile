import 'package:atlas/core/auth/login/bloc/login_bloc.dart';
import 'package:atlas/core/auth/login/views/login_page.dart';
import 'package:atlas/core/auth/register/bloc/register_bloc.dart';
import 'package:atlas/core/auth/register/views/register_page.dart';
import 'package:atlas/core/auth/sms_login/views/sms_login_page.dart';
import 'package:atlas/core/home/bloc/home_bloc.dart';
import 'package:atlas/core/home/views/home.dart';
import 'package:atlas/core/splash/bloc/splash_bloc.dart';
import 'package:atlas/core/splash/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final _splashBloc = SplashBloc();
  final _homeBloc = HomeBloc();
  final _registerBloc = RegisterBloc();
  final _loginBloc = LoginBloc();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _registerBloc,
            child: SplashPage(),
          ),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _homeBloc,
            child: HomePage(),
          ),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _registerBloc,
            child: RegisterPage(),
          ),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginBloc,
            child: LoginPage(),
          ),
        );
      case '/smslogin':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _loginBloc,
            child: SmsLoginPage(),
          ),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }

  void dispose() {
    _splashBloc.close();
    _homeBloc.close();
    _registerBloc.close();
    _loginBloc.close();
  }
}
